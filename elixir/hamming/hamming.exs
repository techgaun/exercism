defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance('AAGTCATA', 'TAGCGATC')
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: non_neg_integer
  def hamming_distance(strand1, strand2) when length(strand1) === length(strand2) do
    {:ok, compare(strand1, strand2, 0)}
  end
  def hamming_distance(_, _), do: {:error, "Lists must be the same length"}

  defp compare([], [], dist), do: dist
  defp compare([h1 | t1], [h2 | t2], dist) when h1 !== h2, do: compare(t1, t2, dist + 1)
  defp compare([_ | t1], [_ | t2], dist), do: compare(t1, t2, dist)
end
