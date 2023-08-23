defmodule TimeManagerWeb.ClockController do
  use TimeManagerWeb, :controller

  alias TimeManager.Clocking
  alias TimeManager.Clocking.Clock
  alias TimeManager.WorkingTimes

  action_fallback TimeManagerWeb.FallbackController

  def index(conn, _params) do
    clocks = Clocking.list_clocks()
    render(conn, "index.json", clocks: clocks)
  end

  def create(conn, %{"userID" => user}) do
    clock = Clocking.get_clock!(user)

    if is_nil(clock) do
      with {:ok, %Clock{} = clock} <-
             Clocking.create_clock(%{
               "user" => user,
               "status" => true,
               "time" => DateTime.add(DateTime.utc_now(), 1, :hour)
             }) do
        conn
        |> put_status(:created)
        |> render("show.json", clock: clock)
      end
    else
      if clock.status do
        WorkingTimes.create_working_time(%{
          "start" => clock.time,
          "end" => DateTime.add(DateTime.utc_now(), 1, :hour),
          "user" => clock.user
        })

        with {:ok, %Clock{} = clock} <-
               Clocking.update_clock(clock, %{
                 "status" => false,
                 "time" => DateTime.add(DateTime.utc_now(), 1, :hour)
               }) do
          conn
          |> put_status(:created)
          |> render("show.json", clock: clock)
        end
      else
        with {:ok, %Clock{} = clock} <-
               Clocking.update_clock(clock, %{
                 "status" => true,
                 "time" => DateTime.add(DateTime.utc_now(), 1, :hour)
               }) do
          conn
          |> put_status(:created)
          |> render("show.json", clock: clock)
        end
      end
    end
  end

  def show(conn, %{"userID" => user}) do
    clock = Clocking.get_clock!(user)
    render(conn, "show.json", clock: clock)
  end

  def update(conn, %{"id" => id, "clock" => clock_params}) do
    clock = Clocking.get_clock!(id)

    with {:ok, %Clock{} = clock} <- Clocking.update_clock(clock, clock_params) do
      render(conn, "show.json", clock: clock)
    end
  end

  def delete(conn, %{"id" => id}) do
    clock = Clocking.get_clock!(id)

    with {:ok, %Clock{}} <- Clocking.delete_clock(clock) do
      send_resp(conn, :no_content, "")
    end
  end
end
