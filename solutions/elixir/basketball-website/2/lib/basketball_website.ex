defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    get_value(data, String.split(path, "."))
  end
  defp get_value(data, []), do: data
  defp get_value(data, [key | rest]), do: get_value(data[key], rest)

  def get_in_path(data, path), do: get_in(data, String.split(path, "."))
end
