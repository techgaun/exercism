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

  defp verse_params(num), do: {"#{bottles(num)}", perform(num), "#{bottles(num - 1)}"}

  defp bottles(0), do: bottles(100)
  defp bottles(1), do: "no more bottles"
  defp bottles(2), do: "1 bottle"
  defp bottles(n), do: "#{n - 1} bottles"

  defp perform(1), do: "Go to the store and buy some more"
  defp perform(2), do: "Take it down and pass it around"
  defp perform(_), do: "Take one down and pass it around"

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t) :: String.t
  def lyrics(range \\ 100..1) do
    range
    |> Stream.map(&verse/1)
    |> Enum.join("\n")
  end
end
