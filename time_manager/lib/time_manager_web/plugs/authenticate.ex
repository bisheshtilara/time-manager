defmodule TimeManagerWeb.Plugs.Authenticate do
  import Plug.Conn
  require Logger

  def init(opts) do
    opts
  end

  def call(conn, _opts) do
    with ["Bearer " <> token] <- get_req_header(conn, "authorization"),
         {:ok, claims} <- TimeManager.Token.verify_and_validate(token) do
      conn
      |> assign(:current_user, TimeManager.Account.get_user!(claims["userID"]))
    else
      _ ->
        conn
        |> put_status(:unauthorized)
        |> Phoenix.Controller.put_view(TimeManagerWeb.ErrorView)
        |> Phoenix.Controller.render(:"401")
        |> halt()
    end
  end
end
