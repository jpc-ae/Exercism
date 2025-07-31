defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep(list, fun), do: do_keep(list, fun, [])
  defp do_keep([], _, acc), do: Enum.reverse(acc)
  defp do_keep([item | tail], fun, acc) do
    do_keep(tail, fun, (if fun.(item), do: [item | acc], else: acc))
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun), do: do_discard(list, fun, [])
  defp do_discard([], _, acc), do: Enum.reverse(acc)
  defp do_discard([item | tail], fun, acc) do
    do_discard(tail, fun, (if fun.(item), do: acc, else: [item | acc]))
  end
end
