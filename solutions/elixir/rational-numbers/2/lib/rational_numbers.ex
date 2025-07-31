defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add({n1, d1}, {n2, d2}) do
    {n1 * d2 + n2 * d1, d1 * d2}
    |> reduce()
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract({n1, d1}, {n2, d2}) do
    {n1 * d2 - n2 * d1, d1 * d2}
    |> reduce()
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply({n1, d1}, {n2, d2}) do
    {n1 * n2, d1 * d2}
    |> reduce()
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by({n1, d1}, {n2, d2}) do
    {n1 * d2, d1 * n2}
    |> reduce()
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs(a) do
    {n, d} = reduce(a)
    {(if n < 0, do: -n, else: n), d}
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational({an, ad}, n) when n < 0 do
    {ad ** -n, an ** -n}
    |> reduce()
  end
  def pow_rational({an, ad}, n) do
    {an ** n, ad ** n}
    |> reduce()
  end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, {nn, nd}) do
    x ** (nn / nd)
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce({n, d}) do
    flipper = if d < 0, do: -1, else: 1
    gcd = find_gcd(n, d)
    {flipper * trunc(n / gcd), flipper * trunc(d / gcd)}
  end
  defp find_gcd(a, b) do
    m = rem((if a < 0, do: -a, else: a), b)
    if m == 0, do: b, else: find_gcd(b, m)
  end
end
