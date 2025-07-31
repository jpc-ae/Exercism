defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    lower_base = String.downcase(base)
    Enum.filter(candidates, &(anagram?(lower_base, String.downcase(&1))))
  end

  defp anagram?(base, base), do: false
  defp anagram?(base, candidate), do: sort_graphemes(base) == sort_graphemes(candidate)

  defp sort_graphemes(word), do: word |> String.graphemes() |> Enum.sort()
end
