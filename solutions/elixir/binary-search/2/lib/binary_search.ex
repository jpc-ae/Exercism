defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search({}, _), do: :not_found
  def search(numbers, key), do: get_index(numbers, key, tuple_size(numbers) - 1)

  defp get_index(numbers, key, min \\ 0, max) do
    case min + div(max - min, 2) do
      index when elem(numbers, index) == key -> {:ok, index}
      index when elem(numbers, index) > key and index < max -> get_index(numbers, key, min, index)
      index when elem(numbers, index) < key and index > min -> get_index(numbers, key, index, max)
      _ when elem(numbers, max) == key -> {:ok, max}
      _ -> :not_found
    end
  end
end
