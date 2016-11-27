defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.

  The check for side lengths can be summarized as below:
  https://en.wikipedia.org/wiki/Triangle_inequality#Euclidean_geometry

  abs(a - b) < c < (a + b)
  """
  @spec kind(number, number, number) :: { :ok, kind } | { :error, String.t }
  def kind(a, b, c) when a <= 0 or b <= 0 or c <= 0, do: { :error, "all side lengths must be positive" }
  def kind(a, b, c) when not (abs(a - b) < c and (a + b) > c), do: { :error, "side lengths violate triangle inequality" }
  def kind(a, a, a), do: { :ok, :equilateral }
  def kind(a, a, _), do: { :ok, :isosceles }
  def kind(_, a, a), do: { :ok, :isosceles }
  def kind(a, _, a), do: { :ok, :isosceles }
  def kind(_, _, _), do: { :ok, :scalene }
end
