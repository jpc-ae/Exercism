defmodule PigLatin do
  @vowels ~w(a e i o u)
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(<<start::binary-size(1), _::binary>> = phrase) when start in @vowels, do: phrase <> "ay"
  def translate(<<start::binary-size(2), _::binary>> = phrase) when start == "xr", do: phrase <> "ay"
  def translate(<<y::binary-size(1), c::binary-size(1), _::binary>> = phrase) when y == "y" and c not in @vowels, do: phrase <> "ay"
  def translate(phrase) do
    Regex.replace(~r/\b(y?\S*?(?:qu)?)([aeiouy].*?)\b/i, phrase, "\\2\\1ay")
  end
end
