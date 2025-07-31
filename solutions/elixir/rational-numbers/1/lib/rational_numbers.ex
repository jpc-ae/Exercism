defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add({n1, d1}, {n2, d2}) do
    reduce({n1 * d2 + n2 * d1, d1 * d2})
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract({n1, d1}, {n2, d2}) do
    reduce({n1 * d2 - n2 * d1, d1 * d2})
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply({n1, d1}, {n2, d2}) do
    reduce({n1 * n2, d1 * d2})
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by({n1, d1}, {n2, d2}) do
    reduce({n1 * d2, d1 * n2})
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs(a) do
    {n, d} = reduce(a)
    {(if n < 0, do: n * -1, else: n), d}
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational({an, ad}, n) when n < 0 do
    m = Kernel.abs(n)
    reduce({ad ** m, an ** m})
  end
  def pow_rational({an, ad}, n) do
    reduce({an ** n, ad ** n})
  end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, {nn, nd}) do
    x ** nn ** (1 / nd)
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce({n, d}) do
    flip_sign = if n - d > n, do: -1, else: 1
    gcd = Integer.gcd(n, d)
    {flip_sign * trunc(n / gcd), flip_sign * trunc(d / gcd)}
  end
end
