defmodule AllYourBase do
  @doc """
  Given a number in input base, represented as a sequence of digits, converts it to output base,
  or returns an error tuple if either of the bases are less than 2
  """
  @spec convert(list, integer, integer) :: {:ok, list} | {:error, String.t()}
  def convert(_, input_base, _) when input_base < 2,
    do: {:error, "input base must be >= 2"}

  def convert(_, _, output_base) when output_base < 2,
    do: {:error, "output base must be >= 2"}

  def convert(digits, input_base, output_base) do
    with {:ok, number} <- to_number(digits, input_base),
      do: to_digits(number, output_base, [])
  end

  defp to_number(digits, base) do
    cond do
      Enum.any?(digits, &(&1 < 0 or &1 >= base)) ->
        {:error, "all digits must be >= 0 and < input base"}
        
      true ->
        digits
        |> Enum.reverse()
        |> Enum.with_index(&({&1, Integer.pow(base, &2)}))
        |> Enum.reduce(0, fn ({digit, index}, acc) -> acc + (digit * index) end)
        |> then(&({:ok, &1}))
    end
  end
  
  defp to_digits(num, base, digits) when num < base, do: {:ok, [num | digits]}
  defp to_digits(num, base, digits),
    do: to_digits(trunc(num / base), base, [rem(num, base) | digits])
end
