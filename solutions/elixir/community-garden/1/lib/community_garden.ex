# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  use Agent
  
  def start(opts \\ []), do: Agent.start(fn -> %{next_id: 1, plots: []} end, opts)

  def list_registrations(pid), do: Agent.get(pid, &(&1.plots))

  def register(pid, register_to) do
    Agent.get_and_update(pid, fn %{next_id: id, plots: plots} ->
      new_plot = %Plot{plot_id: id, registered_to: register_to}
      {new_plot, %{next_id: id + 1, plots: [new_plot | plots]}}
    end)
  end

  def release(pid, plot_id) do
    Agent.update(pid, fn %{next_id: id, plots: plots} ->
      %{next_id: id, plots: Enum.reject(plots, &(&1.plot_id == plot_id))}
    end)
  end

  def get_registration(pid, plot_id) do
    Agent.get(pid, fn %{plots: plots} -> 
      Enum.find(plots, {:not_found, "plot is unregistered"}, &(&1.plot_id == plot_id))
    end)
  end
end
