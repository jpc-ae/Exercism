defmodule Username do
  def sanitize(username) do
    # ä becomes ae
    # ö becomes oe
    # ü becomes ue
    # ß becomes ss

    sanitize(username, [])
  end
  defp sanitize([], acc), do: acc
  defp sanitize([h | t], acc) when h == ?ä, do: sanitize(t, acc ++ ~c"ae")
  defp sanitize([h | t], acc) when h == ?ö, do: sanitize(t, acc ++ ~c"oe")
  defp sanitize([h | t], acc) when h == ?ü, do: sanitize(t, acc ++ ~c"ue")
  defp sanitize([h | t], acc) when h == ?ß, do: sanitize(t, acc ++ ~c"ss")
  defp sanitize([h | t], acc) when h in ?a..?z or h == ?_, do: sanitize(t, acc ++ [h])
  defp sanitize([h | t], acc), do: sanitize(t, acc)
end
