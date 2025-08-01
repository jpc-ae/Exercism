defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    lower_base = String.downcase(base)
    base_frequencies = lower_base |> String.graphemes() |> Enum.frequencies()
    Enum.filter(candidates, &(anagram?(String.downcase(&1), lower_base, base_frequencies)))
  end

  defp anagram?(candidate, candidate, _), do: false
  defp anagram?(candidate, _, base_frequencies),
    do: base_frequencies === candidate |> String.graphemes() |> Enum.frequencies()
end
