defmodule Prime do
  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(count) when count > 0, do: get_prime(count)

  defp get_prime(count, n \\ 2, prime \\ 3, test \\ 6, plus_minus \\ -1)
  defp get_prime(1, _, _, _, _), do: 2
  defp get_prime(count, count, prime, _, _), do: prime
  
  defp get_prime(count, n, prime, test, plus_minus) when plus_minus == -1 do
    if prime?(test - 1) do
      get_prime(count, n + 1, test - 1, test, 1)
    else
      get_prime(count, n, prime, test, 1)
    end
  end
  
  defp get_prime(count, n, prime, test, plus_minus) when plus_minus == 1 do
    if prime?(test + 1) do
      get_prime(count, n + 1, test + 1, test + 6, -1)
    else
      get_prime(count, n, prime, test + 6, -1)
    end
  end

  defp prime?(n) when n > 1 do
    highest_factor = trunc(:math.sqrt(n))
    !factorable?(n, highest_factor)
  end

  defp factorable?(_, factor) when factor == 1, do: false
  defp factorable?(n, factor) when rem(n, factor) == 0, do: true
  defp factorable?(n, factor), do: factorable?(n, factor - 1)
end
