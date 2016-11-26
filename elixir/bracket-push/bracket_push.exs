defmodule BracketPush do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t) :: boolean
  def check_brackets(str) do
    str
    # |> String.replace(~r/[^\(\[\{\}\]\)]/, "") # the valid_brackets? should be able to handle this.
    |> String.split("")
    |> valid_brackets?([])
  end

  defp valid_brackets?([], []), do: true
  defp valid_brackets?([], _), do: false
  defp valid_brackets?([c | t], stack) when c in ~W/( { [/, do: valid_brackets?(t, [c | stack])
  defp valid_brackets?([")" | t], ["(" | stack]), do: valid_brackets?(t, stack)
  defp valid_brackets?(["}" | t], ["{" | stack]), do: valid_brackets?(t, stack)
  defp valid_brackets?(["]" | t], ["[" | stack]), do: valid_brackets?(t, stack)
  defp valid_brackets?([c | _], _) when c in ~W/) } ]/, do: false
  defp valid_brackets?([_ | t], stack), do: valid_brackets?(t, stack)
end
