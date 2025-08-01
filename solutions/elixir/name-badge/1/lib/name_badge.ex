defmodule NameBadge do
  def print(id, name, department) do
    dept = if department, do: String.upcase(department), else: "OWNER"
    text_id = if id, do: "[#{id}] - ", else: ""
    text_id <> "#{name} - #{dept}"
  end
end
