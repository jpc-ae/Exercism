defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.split(~r/[^\w']|_/u, trim: true)
    |> Enum.map(&(String.at(&1, 0)))
    |> Enum.join()
    |> String.upcase()
  end
end
