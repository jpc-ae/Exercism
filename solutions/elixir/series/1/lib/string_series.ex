defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(s, size) when size < 1, do: []
  def slices(s, size), do: slice(s, size, String.length(s) - size)

  defp slice(s, size, position, list \\ [])
  defp slice(_, _, position, list) when position < 0, do: list
  defp slice(s, size, position, list), do: slice(s, size, position - 1, [String.slice(s, position, size) | list])
end
