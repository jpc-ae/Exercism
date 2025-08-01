defmodule BirdCount do
  def today([]), do: nil
  def today([count | _]), do: count
  
  def increment_day_count([]), do: [1]
  def increment_day_count([count | list]), do: [count + 1 | list]

  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([h | t]) do
    h == 0 or has_day_without_birds?(t)
  end

  def total(list), do: total(list, 0)
  defp total([], acc), do: acc
  defp total([h | t], acc), do: total(t, acc + h)

  def busy_days(list), do: busy_days(list, 0)
  defp busy_days([], acc), do: acc
  defp busy_days([h | t], acc) when h > 4, do: busy_days(t, acc + 1)
  defp busy_days([_ | t], acc), do: busy_days(t, acc)
end
