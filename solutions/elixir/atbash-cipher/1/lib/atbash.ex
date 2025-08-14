defmodule Atbash do
  @doc """
  Encode a given plaintext to the corresponding ciphertext

  ## Examples

  iex> Atbash.encode("completely insecure")
  "xlnko vgvob rmhvx fiv"
  """
  @spec encode(String.t()) :: String.t()
  def encode(plaintext), do: plaintext |> String.to_charlist |> a_to_z()

  defp a_to_z(charlist, cipher \\ "", group_pos \\ 0)
  defp a_to_z([], cipher, _), do: cipher
  defp a_to_z([char | _] = charlist, cipher, 5)
    when char in ?0..?9 or char in ?a..?z or char in ?A..?Z,
    do: a_to_z(charlist, cipher <> " ", 0)
    
  defp a_to_z([char | tail], cipher, group_pos) when char in ?0..?9,
    do: a_to_z(tail, cipher <> <<char>>, group_pos + 1)

  defp a_to_z([char | tail], cipher, group_pos) when char in ?a..?z,
    do: a_to_z(tail, cipher <> <<?a + ?z - char>>, group_pos + 1)

  defp a_to_z([char | tail], cipher, group_pos) when char in ?A..?Z,
    do: a_to_z(tail, cipher <> <<?a + ?Z - char>>, group_pos + 1)

  defp a_to_z([_ | tail], cipher, group_pos), do: a_to_z(tail, cipher, group_pos)
  
  @spec decode(String.t()) :: String.t()
  def decode(cipher), do: cipher |> String.to_charlist |> z_to_a()

  defp z_to_a(charlist, plaintext \\ "")
  defp z_to_a([], plaintext), do: plaintext
  defp z_to_a([char | tail], plaintext) when char in ?0..?9, do: z_to_a(tail, plaintext <> <<char>>)
  defp z_to_a([char | tail], plaintext) when char in ?a..?z,
    do: z_to_a(tail, plaintext <> <<?a + ?z - char>>)
    
  defp z_to_a([_ | tail], plaintext), do: z_to_a(tail, plaintext)
end
