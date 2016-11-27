defmodule Prime do
  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(count) do
    nth(count, 1, 2, 3)
  end

  def nth(count, _, _, _) when count < 1, do: raise ArgumentError, message: "count can not be less than one"
  def nth(count, current, prime_val, _) when count === current, do: prime_val
  def nth(count, current, prime_val, num) do
    is_prime = prime?(num, 2)
    prime_val = if is_prime, do: num, else: prime_val
    current = if is_prime, do: current + 1, else: current
    nth(count, current, prime_val, num + 1)
  end

  def prime?(num, i), do: prime?(num, i, true)
  def prime?(_, _, false), do: false
  def prime?(num, i, _) when i <= num / 2 do
    prime?(num, i + 1, rem(num, i) !== 0)
  end
  def prime?(num, i, true) when i > (num / 2), do: true
end
