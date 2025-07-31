defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    lower_base = String.downcase(base)
  
    candidates
    |> Enum.reject(&(String.downcase(&1) == lower_base))
    |> filter_candidates([], String.graphemes(lower_base))
  end

  defp filter_candidates([], acc, _), do: Enum.reverse(acc)
  defp filter_candidates([candidate | tail], acc, base) do
    grapheme_list = candidate |> String.downcase() |> String.graphemes()
    result = cond do
      length(grapheme_list -- base) > 0 -> acc
      length(base -- grapheme_list) > 0 -> acc
      true -> [candidate | acc]
    end
    filter_candidates(tail, result, base)
  end
end
