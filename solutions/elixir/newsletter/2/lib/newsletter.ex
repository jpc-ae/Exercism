defmodule Newsletter do
  def read_emails(path) do
    emails = File.read!(path) |> String.trim()
    if emails == "" do
      []
    else
      String.split(emails, "\n")
    end
  end

  def open_log(path) do
    File.open!(path, [:write])
  end

  def log_sent_email(pid, email) do
    IO.puts(pid, email)
  end

  def close_log(pid) do
    File.close(pid)
  end

  def send_newsletter(emails_path, log_path, send_fun) do
    log_pid = open_log(log_path)
    
    read_emails(emails_path)
    |> send_emails(log_pid, send_fun)

    close_log(log_pid)
  end
  
  defp send_emails([], _, _), do: :ok
  defp send_emails([address | remaining], log_pid, send_fun) do
    if send_fun.(address) == :ok, do: log_sent_email(log_pid, address)
    send_emails(remaining, log_pid, send_fun)
  end
end
