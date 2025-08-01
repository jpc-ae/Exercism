defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    radius_squared = x ** 2 + y ** 2
    cond do
      radius_squared <= 1 -> 10
      radius_squared <= 25 -> 5
      radius_squared <= 100 -> 1
      true -> 0
    end
  end
end
