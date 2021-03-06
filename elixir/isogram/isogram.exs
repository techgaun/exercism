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
    |> _isogram?(%{})
  end

  def _isogram?([], _), do: true
  def _isogram?([h | t], acc) do
    case acc do
      %{^h => true} -> false
      _ ->
        _isogram?(t, Map.put(acc, h, true))
    end
  end
end
