defmodule TimeManagerWeb.TeamView do
  use TimeManagerWeb, :view
  alias TimeManagerWeb.TeamView

  def render("index.json", %{teams: teams}) do
    %{data: render_many(teams, TeamView, "team.json")}
  end

  def render("show.json", %{team: team}) do
    %{data: render_one(team, TeamView, "team.json")}
  end

  def render("team.json", %{team: team}) do
    %{
      id: team.id,
      users: team.users,
      name: team.name,
      creator: team.creator
    }
  end
end
