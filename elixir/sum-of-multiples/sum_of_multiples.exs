defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    limit
    |> Kernel.-(1)
    |> sum(factors, 0)
  end
  def sum(v, _factors, sum) when v < 1, do: sum
  def sum(v, factors, sum) do
    sum = if factor?(v, factors, false) do
      sum + v
    else
      sum
    end
    sum(v - 1, factors, sum)
  end

  def factor?(_, _, true), do: true
  def factor?(_v, [], is_factor), do: is_factor
  def factor?(v, [h | t], _is_factor) do
    factor?(v, t, rem(v, h) === 0)
  end
end
