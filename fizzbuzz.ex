defmodule Fizzbuzz do
  def print do
    1..100
    |> Enum.map(fn x ->
      cond do
        divisible_by_3?(x) and divisible_by_5?(x) ->
          "FizzBuzz"
        divisible_by_3?(x) ->
          "Fizz"
        divisible_by_5?(x) ->
          "Buzz"
        true -> x
      end
    end)
  end
  def divisible_by_3?(n), do: rem(n, 3) === 0
  def divisible_by_5?(n), do: rem(n, 5) === 0
end
