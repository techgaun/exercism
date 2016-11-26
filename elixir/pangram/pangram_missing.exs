defmodule Pangram do
  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.

  Returns a boolean.

    ## Examples

      iex> Pangram.pangram?("the quick brown fox jumps over the lazy dog")
      true

  """

  @spec pangram?(String.t) :: boolean
  def pangram?(sentence) do
    chr_s = sentence
      |> String.downcase
      |> to_charlist
    not missing?( ?a..?z,  chr_s)
  end

  def missing?(first..last, _) when first >= last, do: false
  def missing?(_, []), do: true
  def missing?(first..last, chrs) do
    if first in chrs and last in chrs do
      missing?(first + 1..last - 1, chrs)
    else
      true
    end
  end
end
