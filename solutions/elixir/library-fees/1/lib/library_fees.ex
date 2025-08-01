defmodule LibraryFees do
  def datetime_from_string(string), do: NaiveDateTime.from_iso8601!(string)

  def before_noon?(datetime), do: datetime.hour < 12

  def return_date(checkout_datetime) do
    if before_noon?(checkout_datetime) do
      NaiveDateTime.add(checkout_datetime, 28, :day)
    else
      NaiveDateTime.add(checkout_datetime, 29, :day)
    end
    |> NaiveDateTime.to_date()
  end

  def days_late(planned_return_date, actual_return_datetime) do
    diff = NaiveDateTime.to_date(actual_return_datetime) |> Date.diff(planned_return_date)
    if diff > 0, do: diff, else: 0
  end

  def monday?(datetime) do
    datetime
    |> NaiveDateTime.to_date()
    |> Date.day_of_week()
    |> Kernel.==(1)
  end

  def calculate_late_fee(checkout, return, rate) do
    planned_return_date = checkout |> datetime_from_string() |> return_date()
    actual_return_datetime = datetime_from_string(return)
    
    late_fee = rate * days_late(planned_return_date, actual_return_datetime)
    
    if monday?(actual_return_datetime), do: trunc(0.5 * late_fee), else: late_fee
  end
end
