defmodule TimeManager.Teams.Team do
  use Ecto.Schema
  import Ecto.Changeset

  schema "teams" do
    field :name, :string
    field :users, {:array, :integer}
    field :creator, :integer

    timestamps()
  end

  @doc false
  def changeset(team, attrs) do
    team
    |> cast(attrs, [:users, :name, :creator])
    |> validate_required([:users, :name, :creator])
  end
end
