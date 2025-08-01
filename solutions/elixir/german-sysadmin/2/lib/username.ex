defmodule Username do
  def sanitize(username) do
    # ä becomes ae
    # ö becomes oe
    # ü becomes ue
    # ß becomes ss

    sanitize(username, [])
  end
  defp sanitize([], acc), do: acc
  defp sanitize([h | t], acc) do
    case h do
      h when h in ?a..?z or h == ?_ -> sanitize(t, acc ++ [h])
      h when h == ?ä -> sanitize(t, acc ++ ~c"ae")
      h when h == ?ö -> sanitize(t, acc ++ ~c"oe")
      h when h == ?ü -> sanitize(t, acc ++ ~c"ue")
      h when h == ?ß -> sanitize(t, acc ++ ~c"ss")
      _ -> sanitize(t, acc)
    end
  end
end
