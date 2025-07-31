defmodule Secrets do
  def secret_add(n), do: &(&1 + n)
  def secret_subtract(n), do: &(&1 - n)
  def secret_multiply(n), do: &(&1 * n)
  def secret_divide(n), do: &(div(&1,n))
  def secret_and(n), do: &(Bitwise.band(&1,n))
  def secret_xor(n), do: &(Bitwise.bxor(&1,n))
  
  def secret_combine(secret_fn1, secret_fn2) do
    fn n ->
      n
      |> secret_fn1.()
      |> secret_fn2.()
    end
  end
end
