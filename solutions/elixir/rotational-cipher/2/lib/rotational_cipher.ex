defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    shift_char = fn
      char when char in ?A..?Z -> <<?A + rem(char - ?A + shift, 26)>>
      char when char in ?a..?z -> <<?a + rem(char - ?a + shift, 26)>>
      char -> <<char>>
    end
    text |> String.to_charlist() |> Enum.map_join(shift_char)
  end
end
