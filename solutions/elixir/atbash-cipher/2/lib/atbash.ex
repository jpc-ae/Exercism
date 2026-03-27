defmodule Atbash do  
  @doc """
  Encode a given plaintext to the corresponding ciphertext

  ## Examples

  iex> Atbash.encode("completely insecure")
  "xlnko vgvob rmhvx fiv"
  """
  @spec encode(String.t()) :: String.t()
  def encode(plaintext) do
    plaintext
    |> String.downcase()
    |> String.to_charlist()
    |> Enum.map_join(&transpose/1)
    |> String.replace(~r/(.{5})\B/, "\\1 ")
  end
  
  @spec decode(String.t()) :: String.t()
  def decode(cipher) do
    cipher
    |> String.to_charlist()
    |> Enum.map_join(&transpose/1)
  end

  defp transpose(char) when char in ?0..?9, do: <<char>>
  defp transpose(char) when char in ?a..?z, do: <<?a + ?z - char>>
  defp transpose(_), do: ""
end
