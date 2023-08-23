defmodule TimeManager.Repo.Migrations.CreateTeams do
  use Ecto.Migration

  def change do
    create table(:teams) do
      add :users, {:array, :integer}, null: false
      add :name, :string, null: false
      add :creator, :integer, null: false

      timestamps()
    end
  end
end
