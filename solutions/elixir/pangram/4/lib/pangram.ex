defmodule Pangram do
  import Bitwise
  
  @ascii_uppercase ~w(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)
  @uppercase_offset 65
  @ascii_lowercase ~w(a b c d e f g h i j k l m n o p q r s t u v w x y z)
  @lowercase_offset 97
  @all_binary_flags 67108863 # 11111111111111111111111111

  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.

  Returns a boolean.

    ## Examples

      iex> Pangram.pangram?("the quick brown fox jumps over the lazy dog")
      true

  """
  @spec pangram?(String.t()) :: boolean
  def pangram?(sentence), do: contains_all_letters(0, String.graphemes(sentence))

  defp contains_all_letters(@all_binary_flags, _), do: true
  defp contains_all_letters(_, []), do: false
  defp contains_all_letters(char_flags, [char | tail]) when char in @ascii_uppercase do
    1 <<< (:binary.decode_unsigned(char) - @uppercase_offset)
    |> bor(char_flags)
    |> contains_all_letters(tail)
  end
  
  defp contains_all_letters(char_flags, [char | tail]) when char in @ascii_lowercase do
    1 <<< (:binary.decode_unsigned(char) - @lowercase_offset)
    |> bor(char_flags)
    |> contains_all_letters(tail)
  end
  
  defp contains_all_letters(char_flags, [_ | tail]), do: contains_all_letters(char_flags, tail)
end
