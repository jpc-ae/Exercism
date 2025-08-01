defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t()
  def convert(x) when rem(x, 3) == 0 and rem(x, 5) == 0 and rem(x, 7) == 0, do: "PlingPlangPlong"
  def convert(x) when rem(x, 3) == 0 and rem(x, 5) == 0, do: "PlingPlang"
  def convert(x) when rem(x, 3) == 0 and rem(x, 7) == 0, do: "PlingPlong"
  def convert(x) when rem(x, 5) == 0 and rem(x, 7) == 0, do: "PlangPlong"
  def convert(x) when rem(x, 3) == 0, do: "Pling"
  def convert(x) when rem(x, 5) == 0, do: "Plang"
  def convert(x) when rem(x, 7) == 0, do: "Plong"
  def convert(x), do: "#{x}"
end
