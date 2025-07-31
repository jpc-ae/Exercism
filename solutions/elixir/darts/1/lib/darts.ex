defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    radius = (x ** 2 + y ** 2) ** 0.5
    cond do
      radius <= 1 -> 10
      radius <= 5 -> 5
      radius <= 10 -> 1
      true -> 0
    end
  end
end
