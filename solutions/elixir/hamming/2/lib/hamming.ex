defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance(~c"AAGTCATA", ~c"TAGCGATC")
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: {:ok, non_neg_integer} | {:error, String.t()}
  def hamming_distance(strand1, strand2) when length(strand1) != length(strand2),
    do: {:error, "strands must be of equal length"}

  def hamming_distance(strand1, strand2),
    do: {:ok, count_differences(strand1, strand2)}

  defp count_differences(strand1, strand2), do: count_differences(0, strand1, strand2)
  defp count_differences(total, [], []), do: total
  defp count_differences(total, [head1 | tail1], [head2 | tail2]) do
    if head1 == head2 do total else 1 + total end
    |> count_differences(tail1, tail2)
  end
end
