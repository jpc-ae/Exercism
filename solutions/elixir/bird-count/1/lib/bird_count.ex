defmodule BirdCount do
  def today([]), do: nil
  def today([count | _]), do: count
  
  def increment_day_count([]), do: [1]
  def increment_day_count([count | list]), do: [count + 1 | list]

  def has_day_without_birds?(list), do: 0 in list

  def total(list, acc \\ 0)
  def total([], acc), do: acc
  def total([h | t], acc), do: total(t, acc + h)

  def busy_days(list, acc \\ 0)
  def busy_days([], acc), do: acc
  def busy_days([h | t], acc) when h > 4, do: busy_days(t, acc + 1)
  def busy_days([_ | t], acc), do: busy_days(t, acc)
end
