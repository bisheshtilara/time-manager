defmodule TimeManagerWeb.UserController do
  use TimeManagerWeb, :controller

  alias TimeManager.Account
  alias TimeManager.Account.User
  alias TimeManager.Repo

  action_fallback TimeManagerWeb.FallbackController

  def index(conn, params) do
    if is_nil(params["email"]) or is_nil(params["username"]) do
      users = Account.list_users()
      render(conn, "index.json", users: users)
    else
      user = Repo.get_by(User, email: params["email"], username: params["username"])
      render(conn, "show.json", user: user)
    end
  end

  def create(conn, user_params) do
    with {:ok, %User{} = user} <- Account.create_user(user_params) do
      conn
      |> put_status(:created)
      |> render("show.json", user: user)
    end
  end

  def show(conn, %{"userID" => id}) do
    user = Account.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, params) do
    user = Account.get_user!(params["userID"])

    with {:ok, %User{} = user} <- Account.update_user(user, params) do
      render(conn, "show.json", user: user)
    end
  end

  def login(conn, %{"email" => email, "password" => password}) do
    params = %{"email" => email, "password" => password}
    user = Repo.get_by(User, email: params["email"])
    result = Bcrypt.verify_pass(password, user.password_hash)

    extra_claims = %{
      "userID" => user.id,
      "username" => user.username,
      "email" => user.email,
      "role" => user.role
    }

    if result do
      token = TimeManager.Token.generate_and_sign!(extra_claims)

      json(conn, %{
        username: user.username,
        email: user.email,
        role: user.role,
        userID: user.id,
        token: token
      })
    else
      conn
      |> put_status(:unauthorized)
      |> render("error.json", message: "Invalid credentials")
    end
  end

  def check_password(conn, %{"userID" => id, "password" => password}) do
    user = Account.get_user!(id)
    result = Bcrypt.verify_pass(password, user.password_hash)

    if result do
      json(conn, %{
        response: true
      })
    else
      json(conn, %{
        response: false
      })
    end
  end

  def delete(conn, %{"userID" => id}) do
    user = Account.get_user!(id)

    if conn.assigns.current_user.role == "admin" or
         conn.assigns.current_user.role == "general-manager" or
         conn.assigns.current_user.id == user.id do
      with {:ok, %User{}} <- Account.delete_user(user) do
        json(conn, %{status: 200, message: "User deleted successfully"})
      end
    else
      if conn.assigns.current_user.role != "admin" or conn.assigns.current_user.id != user.id do
        conn
        |> put_status(:unauthorized)
        |> render("error.json", message: "You are not authorized to delete this user")
      end
    end
  end
end
