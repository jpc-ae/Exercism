defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    ~r/(?<!_)\B[\w']+|[\W_]/u
    |> Regex.replace(string, "")
    |> String.upcase()
  end
end
