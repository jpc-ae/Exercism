defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance(~c"AAGTCATA", ~c"TAGCGATC")
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: {:ok, non_neg_integer} | {:error, String.t()}
  def hamming_distance(strand1, strand2), do: compare(strand1, strand2, 0)

  defp compare([], [], distance), do: {:ok, distance}
  defp compare([head1 | tail1], [head1 | tail2], distance),
    do: compare(tail1, tail2, distance)

  defp compare([_ | tail1], [_ | tail2], distance),
    do: compare(tail1, tail2, 1 + distance)

  defp compare(_, _, _),
    do: {:error, "strands must be of equal length"}
end
