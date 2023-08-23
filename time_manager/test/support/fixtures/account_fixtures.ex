defmodule TimeManager.AccountFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TimeManager.Account` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "some email",
        username: "some username"
      })
      |> TimeManager.Account.create_user()

    user
  end
end
