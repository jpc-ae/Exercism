defmodule TopSecret do
  def to_ast(string), do: Code.string_to_quoted!(string)

  def decode_secret_message_part({fun, _meta, args} = ast, acc) when fun in [:def, :defp] do
    case args do
      [{:when, _, [{name, _, arglist} | _]} | _] ->
        {ast, [String.slice(to_string(name), 0, length(arglist)) | acc]}
      [{_, _, nil} | _] ->
        {ast, ["" | acc]}
      [{name, _, arglist} | _] ->
        {ast, [String.slice(to_string(name), 0, length(arglist)) | acc]}
      _ ->
        {ast, acc}
    end
  end
  def decode_secret_message_part(ast, acc) do
    {ast, acc}
  end

  def decode_secret_message(string) do
    string
    |> to_ast()
    |> Macro.prewalk([], &decode_secret_message_part/2)
    |> then(fn {_, parts} -> parts end)
    |> Enum.reverse()
    |> Enum.join()
  end
end