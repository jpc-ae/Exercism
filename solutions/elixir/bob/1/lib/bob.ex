defmodule Bob do
  @spec hey(String.t()) :: String.t()
  def hey(input) do
    is_question = input |> String.trim() |> String.last() == "?"
    is_yelling = String.upcase(input) == input and Regex.match?(~r/\p{Lu}/u, input)
    is_silent = !Regex.match?(~r/\S/u, input)
    
    cond do
      is_silent -> "Fine. Be that way!"
      is_question and is_yelling -> "Calm down, I know what I'm doing!"
      is_question -> "Sure."
      is_yelling -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end
end
