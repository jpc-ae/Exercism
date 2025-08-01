defmodule Username do
  def sanitize(username), do: sanitize(username, [])
  defp sanitize([], acc), do: acc
  defp sanitize([h | t], acc) do
    c = case h do
      ?_ -> [?_]
      ?ä -> ~c"ae"
      ?ö -> ~c"oe"
      ?ü -> ~c"ue"
      ?ß -> ~c"ss"
      h when h in ?a..?z -> [h]
      _ -> []
    end
    sanitize(t, acc ++ c)
  end
end
