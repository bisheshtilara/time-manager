defmodule TimeManager.ClockingFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TimeManager.Clocking` context.
  """

  @doc """
  Generate a clock.
  """
  def clock_fixture(attrs \\ %{}) do
    {:ok, clock} =
      attrs
      |> Enum.into(%{
        status: true,
        time: ~N[2022-10-24 17:52:00]
      })
      |> TimeManager.Clocking.create_clock()

    clock
  end
end
