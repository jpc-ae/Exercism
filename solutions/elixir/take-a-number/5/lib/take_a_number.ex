defmodule TakeANumber do
  def start() do
    spawn(&loop/0)
  end

  defp loop(current_state \\ 0) do
    receive do
      {:report_state, sender_pid} ->
        send(sender_pid, current_state)
        loop(current_state)

      {:take_a_number, sender_pid} ->
        next_state = current_state + 1
        send(sender_pid, next_state)
        loop(next_state)

      :stop ->
        :ok

      _ ->
        loop(current_state)
    end
  end
end
