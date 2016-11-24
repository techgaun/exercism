defmodule Raindrops do
  @outputs [{3, "Pling"}, {5, "Plang"}, {7, "Plong"}]
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    for {k, v} <- @outputs do
      if rem(number, k) === 0, do: v, else: ""
    end
    |> Enum.join()
    |> convert(number)
  end

  @spec convert(String.t, pos_integer) :: String.t
  def convert(str, num) when str === "", do: "#{num}"
  def convert(str, _), do: str
end
