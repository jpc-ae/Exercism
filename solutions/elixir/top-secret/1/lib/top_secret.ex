defmodule TopSecret do
  def to_ast(string) do
    case Code.string_to_quoted(string) do
      {:ok, ast} -> ast
      err -> err
    end
  end

  def decode_secret_message_part(ast, acc) do
    case ast do
      {fun, _, [{:when, _, [{name, _, args} | _]} | _]} when fun in [:def, :defp] ->
        {ast, [String.slice(to_string(name), 0, length(args)) | acc]}
      {fun, _, [{_, _, nil} | _]} when fun in [:def, :defp] ->
        {ast, ["" | acc]}
      {fun, _, [{name, _, args} | _]} when fun in [:def, :defp] ->
        {ast, [String.slice(to_string(name), 0, length(args)) | acc]}
      _ ->
        {ast, acc}
    end
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