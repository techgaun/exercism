defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(l), do: do_count(l, 0)
  defp do_count([], cnt), do: cnt
  defp do_count([_h | t], cnt), do: do_count(t, cnt + 1)

  @spec reverse(list) :: list
  def reverse(l), do: do_reverse(l, [])
  defp do_reverse([], acc), do: acc
  defp do_reverse([h | t], acc), do: do_reverse(t, [h | acc])

  @spec map(list, (any -> any)) :: list
  def map(l, f), do: l |> do_map(f, []) |> reverse
  defp do_map([], _, acc), do: acc
  defp do_map([h | t], f, acc), do: do_map(t, f, [f.(h) | acc])

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f), do: l |> do_filter(f, []) |> reverse
  defp do_filter([], _, acc), do: acc
  defp do_filter([h | t], f, acc) do
    acc = if f.(h), do: [h | acc], else: acc
    do_filter(t, f, acc)
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce(l, acc, f), do: do_reduce(l, acc, f)
  defp do_reduce([], acc, _), do: acc
  defp do_reduce([h | t], acc, f), do: do_reduce(t, f.(h, acc), f)

  @spec append(list, list) :: list
  def append(a, b), do: do_append(reverse(a), b) |> reverse
  defp do_append(a, []), do: a
  defp do_append(a, [h | t]), do: do_append([h | a], t)

  @spec concat([[any]]) :: [any]
  def concat(ll), do: do_concat(ll, []) |> reverse
  defp do_concat([], acc), do: acc
  defp do_concat([[] | t], acc), do: do_concat(t, acc)
  defp do_concat([[hi | ti] | t], acc), do: do_concat(t, do_concat(ti, [hi | acc]))
  defp do_concat([h | t], acc), do: do_concat(t, [h | acc])
end
