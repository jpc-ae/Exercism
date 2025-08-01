defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    ~r/([[:alpha:]])[[:alpha:]'’]*/u
    |> Regex.scan(string)
    |> Enum.reduce("", fn ([_match, initial], acc) -> acc <> initial end)
    |> String.upcase()
  end
end
