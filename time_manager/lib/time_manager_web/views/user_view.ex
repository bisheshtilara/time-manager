defmodule TimeManagerWeb.UserView do
  use TimeManagerWeb, :view
  alias TimeManagerWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      username: user.username,
      email: user.email,
      # role: Macro.camelize(user.role)
      role: user.role
    }
  end

  def render("auth.json", %{claims: claims}) do
    %{
      claims: claims
    }
  end

  def render("token.json", %{token: token, user: user}) do
    %{
      token: token,
      username: user.username,
      email: user.email,
      userID: user.id,
      role: user.role
    }
  end

  def render("error.json", %{message: message}) do
    %{error: message}
  end
end
