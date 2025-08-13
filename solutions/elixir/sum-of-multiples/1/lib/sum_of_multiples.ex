defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors), do: gen_score(factors, limit - 1)

  defp gen_score(scores \\ [], factors, limit)
  defp gen_score(scores, [], _), do: scores |> MapSet.new() |> Enum.sum()
  defp gen_score(scores, [0 | tail], max), do: gen_score([0 | scores], tail, max)
  defp gen_score(scores, [factor | tail], max) do
    factor
    |> Range.new(max, factor)
    |> Range.to_list()
    |> Kernel.++(scores)
    |> gen_score(tail, max)
  end
end
