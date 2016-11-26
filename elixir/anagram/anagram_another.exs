defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    base_norm = base
      |> String.downcase
    sorted_base = base_norm
      |> sort_word
    candidates
    |> Enum.filter(&anagram?({base_norm, sorted_base}, &1))
  end

  def anagram?({base_norm, sorted_base}, str) do
    str = String.downcase( str )
    base_norm !== str and sorted_base === sort_word(str)
  end

  def sort_word(w), do: w |> String.graphemes |> Enum.sort
end
