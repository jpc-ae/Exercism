defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift), do: text |> String.to_charlist() |> shift_letters(shift)

  defp shift_letters(charlist, shift, encoded_text \\ "")
  defp shift_letters([], _, encoded_text), do: encoded_text
  defp shift_letters([char | tail], shift, encoded_text) when char in ?A..?Z do
    encoded_char = if (char + shift) > ?Z, do: char - 26 + shift, else: char + shift
    shift_letters(tail, shift, encoded_text <> <<encoded_char>>)
  end
  
  defp shift_letters([char | tail], shift, encoded_text) when char in ?a..?z do
    encoded_char = if (char + shift) > ?z, do: char - 26 + shift, else: char + shift
    shift_letters(tail, shift, encoded_text <> <<encoded_char>>)
  end
  
  defp shift_letters([char | tail], shift, encoded_text),
    do: shift_letters(tail, shift, encoded_text <> <<char>>)
end
