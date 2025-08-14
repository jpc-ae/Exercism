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
  def search(numbers, key) do
    delta = numbers |> tuple_size() |> div(2)
    get_index(numbers, key, delta, delta)
  end

  defp get_index(numbers, key, index, delta, checked \\ [])
  defp get_index(numbers, key, index, _, _) when elem(numbers, index) == key, do: {:ok, index}
  defp get_index(_, _, _, 0, _), do: :not_found
  
  defp get_index(numbers, key, index, delta, checked) when elem(numbers, index) > key do
    if index in checked do
      :not_found
    else
      half = div(delta + 1, 2)
      get_index(numbers, key, index - half, half, [index | checked])
    end
  end
    
  defp get_index(numbers, key, index, delta, checked) when elem(numbers, index) < key do
    if index in checked do
      :not_found
    else
      half = div(delta + 1, 2)
      get_index(numbers, key, index + half, half, [index | checked])
    end
  end
  
  defp get_index(_, _, _, _, _), do: :not_found
end
