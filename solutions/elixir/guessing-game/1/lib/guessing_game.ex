defmodule GuessingGame do
  def compare(secret_number, guess) when not is_number(guess), do: "Make a guess"
  def compare(secret_number, guess) when guess == secret_number, do: "Correct"
  def compare(secret_number, guess) when abs(guess - secret_number) < 2 , do: "So close"
  def compare(secret_number, guess) when guess > secret_number, do: "Too high"
  def compare(secret_number, guess) when guess < secret_number, do: "Too low"
  def compare(secret_number), do: "Make a guess"
end
