defmodule FlattenArray do
  @doc """
    Accept a list and return the list flattened without nil values.

    ## Examples

      iex> FlattenArray.flatten([1, [2], 3, nil])
      [1,2,3]

      iex> FlattenArray.flatten([nil, nil])
      []

  """

  @spec flatten(list) :: list
  def flatten(list) do
    do_flatten(list, []) |> reverse([])
  end

  defp do_flatten([], acc), do: acc
  defp do_flatten([h | t], acc) when is_list(h), do: do_flatten(t, do_flatten(h, acc))
  defp do_flatten([h | t], acc) when is_nil(h), do: do_flatten(t, acc)
  defp do_flatten([h | t], acc), do: do_flatten(t, [h | acc])

  defp reverse([], acc), do: acc
  defp reverse([h | t], acc), do: reverse(t, [h | acc])
end
