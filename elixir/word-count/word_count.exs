defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """

  defp normalize_sentence(sentence) do
    sentence
    |> String.downcase
    |> String.replace("_", " ")
  end

  defp update_count(word, map) do
    Map.update(map, word, 1, &(&1 + 1))
  end

  @spec count(String.t) :: map
  def count(sentence) do
    words = sentence
      |> normalize_sentence
      |> String.split(~r/([^\w\p{Pd}])/u, trim: true)
    Enum.reduce(words, Map.new, fn(w, m) -> update_count(w, m) end)
  end
end
