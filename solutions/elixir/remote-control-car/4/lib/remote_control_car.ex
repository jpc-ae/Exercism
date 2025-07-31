defmodule RemoteControlCar do
  @enforce_keys [:nickname]
  defstruct [
    :nickname,
    battery_percentage: 100,
    distance_driven_in_meters: 0
  ]

  def new(nickname \\ "none") do
    %RemoteControlCar{nickname: nickname}
  end

  def display_distance(%RemoteControlCar{distance_driven_in_meters: distance_driven}) do
    "#{distance_driven} meters"
  end

  def display_battery(%RemoteControlCar{battery_percentage: battery}) do
    if battery > 0, do: "Battery at #{battery}%", else: "Battery empty"
  end

  def drive(%RemoteControlCar{
    battery_percentage: battery,
    distance_driven_in_meters: distance_driven
  } = remote_car) when battery > 0 do
    %{remote_car |
      battery_percentage: battery - 1,
      distance_driven_in_meters: distance_driven + 20
    }
  end
  def drive(%RemoteControlCar{} = remote_car), do: remote_car
end
