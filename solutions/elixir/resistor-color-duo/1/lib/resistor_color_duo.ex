defmodule ResistorColorDuo do
  @resistor_bands %{
    black: "0",
    brown: "1",
    red: "2",
    orange: "3",
    yellow: "4",
    green: "5",
    blue: "6",
    violet: "7",
    grey: "8",
    white: "9"
  }
  
  @doc """
  Calculate a resistance value from two colors
  """
  @spec value(colors :: [atom]) :: integer
  def value(colors) do
    colors
    |> Enum.take(2)
    |> Enum.reduce("", &(&2 <> Map.get(@resistor_bands, &1, 0)))
    |> String.to_integer()
  end
end
