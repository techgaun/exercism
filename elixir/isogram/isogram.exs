defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t) :: boolean
  def isogram?(sentence) do
    cleaned = sentence
      |> String.replace([" ", "-"], "")
    cleaned
    |> String.graphemes
    |> Enum.uniq
    |> Enum.count
    |> Kernel.===(String.length(cleaned))
  end
end
