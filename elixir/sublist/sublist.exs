defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  @spec compare(list, list) :: atom
  def compare([], [_ | _]), do: :sublist
  def compare([_ | _], []), do: :superlist
  def compare(a, b) do
    cond do
      a === b ->
        :equal
      sublist?(a, b) ->
        :sublist
      sublist?(b, a) ->
        :superlist
      true ->
        :unequal
    end
  end

  def sublist?(a, b) when length(a) <= length(b) do
    if a === Enum.take(b, Enum.count(a)) do
      true
    else
      [_h | t] = b
      sublist?(a, t)
    end
  end
  def sublist?(_, _), do: false
end
