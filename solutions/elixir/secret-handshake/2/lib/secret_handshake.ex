defmodule SecretHandshake do
  import Bitwise
  
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code), do: do_commands(code)

  defp do_commands(code, actions \\ [])
  defp do_commands(0, actions), do: Enum.reverse(actions)
  defp do_commands(code, actions) when bor(code, 0b1) == code,
    do: do_commands(code - 0b1, ["wink" | actions])
    
  defp do_commands(code, actions) when bor(code, 0b10) == code,
    do: do_commands(code - 0b10, ["double blink" | actions])
    
  defp do_commands(code, actions) when bor(code, 0b100) == code,
    do: do_commands(code - 0b100, ["close your eyes" | actions])
    
  defp do_commands(code, actions) when bor(code, 0b1000) == code,
    do: do_commands(code - 0b1000, ["jump" | actions])
    
  defp do_commands(code, actions) when bor(code, 0b10000) == code, do: actions
  defp do_commands(_, _), do: []
end
