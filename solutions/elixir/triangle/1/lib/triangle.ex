defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: {:ok, kind} | {:error, String.t()}
  def kind(a, b, c) when a <= 0 or b <= 0 or c <= 0, do: {:error, "all side lengths must be positive"}
  def kind(a, a, a), do: {:ok, :equilateral}
  def kind(a, b, c) when a + b >= c and b + c >= a and c + a >= b do
    case {a, b, c} do
      {side, side, _} -> {:ok, :isosceles}
      {side, _, side} -> {:ok, :isosceles}
      {_, side, side} -> {:ok, :isosceles}
      _ -> {:ok, :scalene}
    end
  end
  def kind(_, _, _), do: {:error, "side lengths violate triangle inequality"}
end
