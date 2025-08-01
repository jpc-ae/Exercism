defmodule FreelancerRates do
  def daily_rate(hourly_rate), do: 8.0 * hourly_rate
  def apply_discount(rate, discount), do: rate - ((discount / 100) * rate)
  defp final_rate(hourly_rate, discount), do: hourly_rate |> daily_rate |> apply_discount(discount)
  
  def monthly_rate(hourly_rate, discount) do
    Float.ceil(22 * final_rate(hourly_rate, discount), 0)
    |> trunc
  end
  
  def days_in_budget(budget, hourly_rate, discount) do
    Float.floor(budget / final_rate(hourly_rate, discount), 1)
  end
end
