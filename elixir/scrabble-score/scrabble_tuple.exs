defmodule Scrabble do
  @word [
    {1, ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"]},
    {2, ["D", "G"]},
    {3, ["B", "C", "M", "P"]},
    {4, ["F", "H", "V", "W", "Y"]},
    {5, ["K"]},
    {8, ["J", "X"]},
    {10, ["Q", "Z"]}
  ]
  @doc """
  Calculate the scrabble score for the word.

  A, E, I, O, U, L, N, R, S, T       1
  D, G                               2
  B, C, M, P                         3
  F, H, V, W, Y                      4
  K                                  5
  J, X                               8
  Q, Z                               10
  """
  @spec score(String.t) :: non_neg_integer
  def score(word) do
    word
    |> String.split("")
    |> _score(0)
  end

  def _score([], acc), do: acc
  def _score(wl, acc) do
    [h | t] = wl
    v =
      @word
      |> Enum.find(fn {_k, v} ->
        String.upcase(h) in v
      end)
      |> case do
        {k, _} -> k
        _ -> 0
      end
    _score(t, acc + v)
  end
end
