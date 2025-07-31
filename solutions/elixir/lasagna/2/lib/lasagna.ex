defmodule Lasagna do
  # provide the called for oven timing
  def expected_minutes_in_oven() do
    40
  end
  # calculate the minutes left for cooking
  def remaining_minutes_in_oven(elapsed) do
    expected_minutes_in_oven() - elapsed
  end
  # Calculate tye prep time per layer done
  def preparation_time_in_minutes(layers) do
    layers * 2
  end
  # calculate total time elapsed including prep and cooking
  def total_time_in_minutes(layers, cooking) do
    preparation_time_in_minutes(layers) + cooking
  end
  # alert cooking completion
  def alarm() do
    "Ding!"
  end
end
