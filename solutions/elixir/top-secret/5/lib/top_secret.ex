defmodule TopSecret do
  def to_ast(string), do: Code.string_to_quoted!(string)
  
  def decode_secret_message_part({op, _meta, part} = ast, acc)
      when op in [:def, :defp],
      do: {ast, [decode(part) | acc]}
      
  def decode_secret_message_part(ast, acc), do: {ast, acc}
  
  defp decode([{:when, _, part} | _]), do: decode(part)
  defp decode([{_, _, nil} | _]), do: ""
  defp decode([{name, _, arglist} | _]),
    do: name |> to_string() |> String.slice(0, length(arglist))
    
  def decode_secret_message(string) do
    string
    |> to_ast()
    |> Macro.prewalk([], &decode_secret_message_part/2)
    |> elem(1)
    |> Enum.reverse()
    |> Enum.join()
  end
end