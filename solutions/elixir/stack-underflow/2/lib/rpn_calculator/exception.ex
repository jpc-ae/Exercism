defmodule RPNCalculator.Exception do
  defmodule DivisionByZeroError do
    defexception message: "division by zero occurred"
  end

  defmodule StackUnderflowError do
    defexception [:context, message: "stack underflow occurred"]

    @impl true
    def message(e) do
      e.message <> if e.context, do: ", context: #{e.context}", else: ""
    end

    @impl true
    def exception([]), do: %StackUnderflowError{}
    def exception(context), do: %StackUnderflowError{context: context}
  end

  def divide([]), do: (raise StackUnderflowError, "when dividing")
  def divide([_]), do: (raise StackUnderflowError, "when dividing")
  def divide([0, _]), do: raise DivisionByZeroError
  def divide([d, n]), do: n/d
end
