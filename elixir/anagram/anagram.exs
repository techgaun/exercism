defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    candidates
    |> Enum.filter(&anagram?(base, &1))
  end

  def anagram?(str1, str2) do
    str1 = String.downcase( str1 )
    str2 = String.downcase( str2 )
    str1 !== str2 and sort_word(str1) === sort_word(str2)
  end

  def sort_word(w), do: w |> String.graphemes |> Enum.sort
end
