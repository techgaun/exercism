defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t
  def verse(number) do
    {first, second, third} = verse_params(number)
    """
    #{String.capitalize(first)} of beer on the wall, #{first} of beer.
    #{second}, #{third} of beer on the wall.
    """
  end

  defp verse_params(1), do: {"no more bottles", "Go to the store and buy some more", "99 bottles"}
  defp verse_params(2), do: {"1 bottle", "Take it down and pass it around", "no more bottles"}
  defp verse_params(num), do: {"#{bottles(num - 1)}", "Take one down and pass it around", "#{bottles(num - 2)}"}
  defp bottles(0), do: "no more bottles"
  defp bottles(1), do: "1 bottle"
  defp bottles(n), do: "#{n} bottles"

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t) :: String.t
  def lyrics(range \\ 100..1) do
    range
    |> Enum.map(&(verse(&1)))
    |> Enum.join("\n")
  end
end
