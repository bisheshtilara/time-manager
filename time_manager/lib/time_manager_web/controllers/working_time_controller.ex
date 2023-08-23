defmodule TimeManagerWeb.WorkingTimeController do
  use TimeManagerWeb, :controller

  alias TimeManager.WorkingTimes
  alias TimeManager.WorkingTimes.WorkingTime

  action_fallback TimeManagerWeb.FallbackController

  def list(conn, _params) do
    workingtimes = WorkingTimes.list_workingtimes()
    render(conn, "index_with_user.json", workingtimes: workingtimes)
  end

  def index(conn, params) do
    if is_nil(params["start"]) or is_nil(params["end"]) do
      workingtimes = WorkingTimes.get_working_times_by_user_id(params["userID"])
      render(conn, "index.json", workingtimes: workingtimes)
    else
      workingtimes =
        WorkingTimes.list_working_times_with_params(
          params["userID"],
          params["start"],
          params["end"]
        )

      render(conn, "index.json", workingtimes: workingtimes)
    end
  end

  def create(conn, %{"working_time" => working_time_params, "userID" => user}) do
    working_time_params = Map.put(working_time_params, "user", user)

    with {:ok, %WorkingTime{} = working_time} <-
           WorkingTimes.create_working_time(working_time_params) do
      conn
      |> put_status(:created)
      |> render("show.json", working_time: working_time)
    end
  end

  def show(conn, %{"userID" => user, "id" => id}) do
    working_time = WorkingTimes.get_working_time_with_user_and_id(id, user)
    render(conn, "show.json", working_time: working_time)
  end

  def update(conn, %{"id" => id, "working_time" => working_time_params}) do
    working_time = WorkingTimes.get_working_time!(id)

    with {:ok, %WorkingTime{} = working_time} <-
           WorkingTimes.update_working_time(working_time, working_time_params) do
      render(conn, "show.json", working_time: working_time)
    end
  end

  def delete(conn, %{"id" => id}) do
    working_time = WorkingTimes.get_working_time!(id)

    with {:ok, %WorkingTime{}} <- WorkingTimes.delete_working_time(working_time) do
      send_resp(conn, :no_content, "")
    end
  end
end
