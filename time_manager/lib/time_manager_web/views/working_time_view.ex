defmodule TimeManagerWeb.WorkingTimeView do
  use TimeManagerWeb, :view

  alias TimeManagerWeb.WorkingTimeView
  alias TimeManager.Account

  def render("index.json", %{workingtimes: workingtimes}) do
    %{data: render_many(workingtimes, WorkingTimeView, "working_time.json")}
  end

  def render("show.json", %{working_time: working_time}) do
    %{data: render_one(working_time, WorkingTimeView, "working_time.json")}
  end

  def render("index_with_user.json", %{workingtimes: workingtimes}) do
    %{data: render_many(workingtimes, WorkingTimeView, "working_time_with_user.json")}
  end

  def render("working_time_with_user.json", %{working_time: working_time}) do
    %{
      id: working_time.id,
      start: working_time.start,
      end: working_time.end,
      user: render_one(Account.get_user!(working_time.user), TimeManagerWeb.UserView, "user.json", as: :user)
    }
  end

  def render("working_time.json", %{working_time: working_time}) do
    %{
      id: working_time.id,
      start: working_time.start,
      end: working_time.end
    }
  end
end
