defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    gen_scores = fn
      0 -> [0]
      factor -> factor |> Range.new(limit - 1, factor) |> Range.to_list()
    end
    
    factors
    |> Enum.flat_map(gen_scores)
    |> Enum.uniq()
    |> Enum.sum()
  end
end
