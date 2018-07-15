defmodule Garden do
  @default_names [:alice, :bob, :charlie, :david, :eve, :fred, :ginny,
                  :harriet, :ileana, :joseph, :kincaid, :larry]
  @plant_mapping %{"V" => :violets, "C" => :clover, "R" => :radishes, "G" => :grass}
  @doc """
    Accepts a string representing the arrangement of cups on a windowsill and a
    list with names of students in the class. The student names list does not
    have to be in alphabetical order.

    It decodes that string into the various gardens for each student and returns
    that information in a map.
  """

  @spec info(String.t(), list) :: map
  def info(info_string, student_names \\ @default_names) do
    [fr, sr] = info_string
      |> String.split("\n")
      |> Enum.map(fn x ->
        x
        |> String.graphemes
        |> Stream.map(fn x ->
          @plant_mapping[x]
        end)
        |> Enum.chunk(2)
      end)
    student_names
    |> Stream.with_index
    |> Enum.reduce(%{}, fn {x, idx}, acc ->
      Map.put(acc, x, Enum.at(sr, idx))# ++ Enum.at(sr, idx))
    end)
  end
end
