defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t()) :: String.t()
  def encode(string) do
    Regex.replace(~r/(.)\1*/, string, fn
      letter, letter -> letter
      match, letter -> "#{byte_size(match)}" <> letter
    end)
  end

  @spec decode(String.t()) :: String.t()
  def decode(string) do
    Regex.replace(~r/([0-9]*)(.)/, string, fn
      _, "", letter -> letter
      _, count, letter -> String.duplicate(letter, String.to_integer(count))
    end)
  end
end
