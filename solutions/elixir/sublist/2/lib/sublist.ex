defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, a), do: :equal
  def compare(a, b) do
    cond do
      sublist?(a, b) -> :sublist
      sublist?(b, a) -> :superlist
      true -> :unequal
    end
  end

  defp sublist?(a, b) when length(a) > length(b), do: false
  defp sublist?(a, b) do
    if List.starts_with?(b, a), do: true, else: sublist?(a, tl(b))
  end
end
