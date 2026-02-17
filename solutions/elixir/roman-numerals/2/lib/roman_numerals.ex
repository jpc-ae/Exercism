defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number), do: reduce_to_roman(number)

  defp reduce_to_roman(number, numeral \\ "")
  defp reduce_to_roman(0, numeral), do: numeral
  defp reduce_to_roman(number, numeral) when number >= 1000,
    do: reduce_to_roman(number - 1000, numeral <> "M")
    
  defp reduce_to_roman(number, numeral) when number >= 500 and number < 900,
    do: reduce_to_roman(number - 500, numeral <> "D")
    
  defp reduce_to_roman(number, numeral) when number >= 900 or number >= 400,
    do: reduce_to_roman(number + 100, numeral <> "C")
    
  defp reduce_to_roman(number, numeral) when number >= 100,
    do: reduce_to_roman(number - 100, numeral <> "C")

  defp reduce_to_roman(number, numeral) when number >= 50 and number < 90,
    do: reduce_to_roman(number - 50, numeral <> "L")

  defp reduce_to_roman(number, numeral) when number >= 90 or number >= 40,
    do: reduce_to_roman(number + 10, numeral <> "X")

  defp reduce_to_roman(number, numeral) when number >= 10,
    do: reduce_to_roman(number - 10, numeral <> "X")

  defp reduce_to_roman(number, numeral) when number >= 5 and number < 9,
    do: reduce_to_roman(number - 5, numeral <> "V")

  defp reduce_to_roman(number, numeral) when number == 9 or number == 4,
    do: reduce_to_roman(number + 1, numeral <> "I")

  defp reduce_to_roman(number, numeral) when number > 0,
    do: reduce_to_roman(number - 1, numeral <> "I")
end
