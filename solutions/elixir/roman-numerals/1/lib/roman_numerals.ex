defmodule RomanNumerals do
  @ones %{3 => "M", 2 => "C", 1 => "X", 0 => "I"}
  @fives %{2 => "D", 1 => "L", 0 => "V"}
  
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    number
    |> Integer.digits()
    |> reduce_to_roman()
  end

  defp reduce_to_roman(digits, numeral \\ "")
  defp reduce_to_roman([], numeral), do: numeral
  defp reduce_to_roman([digit | rest], numeral) when digit == 0, do: reduce_to_roman(rest, numeral)
  defp reduce_to_roman([digit | rest], numeral) when digit in 1..3 do
    roman_digit = @ones |> Map.get(length(rest)) |> String.duplicate(digit)
    reduce_to_roman(rest, numeral <> roman_digit)
  end
  
  defp reduce_to_roman([digit | rest], numeral) when digit == 4 do
    position = length(rest)
    reduce_to_roman(rest, numeral <> Map.get(@ones, position) <> Map.get(@fives, position))
  end
  
  defp reduce_to_roman([digit | rest], numeral) when digit in 5..8 do
    position = length(rest)
    padding = Map.get(@ones, position)
    roman_digit = @fives |> Map.get(position) |> String.pad_trailing(digit - 4, padding)
    reduce_to_roman(rest, numeral <> roman_digit)
  end
  
  defp reduce_to_roman([digit | rest], numeral) when digit == 9 do
    position = length(rest)
    reduce_to_roman(rest, numeral <> Map.get(@ones, position) <> Map.get(@ones, position + 1))
  end
end
