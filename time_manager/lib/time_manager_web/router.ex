defmodule TimeManagerWeb.Router do
  use TimeManagerWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  pipeline :authenticate do
    plug(TimeManagerWeb.Plugs.Authenticate)
  end

  scope "/api", TimeManagerWeb do
    pipe_through [:api]
    post("/users/login", UserController, :login)
    post("/users/signup", UserController, :create)
  end

  scope "/api", TimeManagerWeb do
    pipe_through [:api, :authenticate]

    # user
    get("/users", UserController, :index)
    get("/users/:userID", UserController, :show)
    post("/users", UserController, :create)
    put("/users/:userID", UserController, :update)
    delete("/users/:userID", UserController, :delete)
    post("/users/:userID/check-password", UserController, :check_password)

    # working times
    get "/workingtimes/:userID", WorkingTimeController, :index
    get "/workingtimes/:userID/:id", WorkingTimeController, :show
    post "/workingtimes/:userID", WorkingTimeController, :create
    delete "/workingtimes/:id", WorkingTimeController, :delete
    put "/workingtimes/:id", WorkingTimeController, :update
    get "/workingtimes", WorkingTimeController, :list

    # clock
    get "/clocks/:userID", ClockController, :show
    post "/clocks/:userID", ClockController, :create
    get "/clocks", ClockController, :index

    # teams
    get "/teams", TeamController, :index
    get "/teams/:id", TeamController, :show
    post "/teams", TeamController, :create
    put "/teams/:id", TeamController, :update
    delete "/teams/:id", TeamController, :delete
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through([:fetch_session, :protect_from_forgery])

      live_dashboard("/dashboard", metrics: TimeManagerWeb.Telemetry)
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through([:fetch_session, :protect_from_forgery])

      forward("/mailbox", Plug.Swoosh.MailboxPreview)
    end
  end
end
