defmodule Scrabble do
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
    |> String.upcase
    |> String.graphemes
    |> _score(0)
  end

  def _score([], acc), do: acc
  def _score([h | t], acc) when h in ~W(A E I O U L N R S T), do: _score(t, acc + 1)
  def _score([h | t], acc) when h in ~W(D G), do: _score(t, acc + 2)
  def _score([h | t], acc) when h in ~W(B C M P), do: _score(t, acc + 3)
  def _score([h | t], acc) when h in ~W(F H V W Y), do: _score(t, acc + 4)
  def _score([h | t], acc) when h in ~W(K), do: _score(t, acc + 5)
  def _score([h | t], acc) when h in ~W(J X), do: _score(t, acc + 8)
  def _score([h | t], acc) when h in ~W(Q Z), do: _score(t, acc + 10)
  def _score([_ | t], acc), do: _score(t, acc)
end
