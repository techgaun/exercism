defmodule Roman do
  @doc """
  Convert the number to a roman number.

  This is slightly bad implementation as its unreadable :D
  """
  @spec numerals(pos_integer) :: String.t
  def numerals(number) do
    numerals(number, "")
  end
  def numerals(0, acc), do: acc
  def numerals(num, acc) when num >= 1000, do: numerals( roman_rem(num, 1000), "#{acc}#{roman_repr(num, 1000)}" )
  def numerals(num, acc) when num >= 500, do: numerals( roman_rem(num, 500), "#{acc}#{roman_repr(num, 500)}" )
  def numerals(num, acc) when num >= 100, do: numerals( roman_rem(num, 100), "#{acc}#{roman_repr(num, 100)}" )
  def numerals(num, acc) when num >= 50, do: numerals( roman_rem(num, 50), "#{acc}#{roman_repr(num, 50)}" )
  def numerals(num, acc) when num >= 10, do: numerals( roman_rem(num, 10), "#{acc}#{roman_repr(num, 10)}" )
  def numerals(num, acc) when num >= 5, do: numerals( roman_rem(num, 5), "#{acc}#{roman_repr(num, 5)}" )
  def numerals(num, acc) when num >= 1, do: numerals( 0, "#{acc}#{roman_repr(num, 1)}" )

  defp roman_repr(num, 1000), do: String.duplicate( "M", div(num, 1000) )
  defp roman_repr(num, 500) when num >= 900, do: "CM"
  defp roman_repr(num, 500), do: String.duplicate( "D", div(num, 500) )
  defp roman_repr(num, 100) when num >= 400, do: "CD"
  defp roman_repr(num, 100), do: String.duplicate( "C", div(num, 100) )
  defp roman_repr(num, 50) when num >= 90, do: "XC"
  defp roman_repr(num, 50), do: String.duplicate( "L", div(num, 50) )
  defp roman_repr(num, 10) when num >= 40, do: "XL"
  defp roman_repr(num, 10), do: String.duplicate( "X", div(num, 10) )
  defp roman_repr(num, 5) when num >= 9, do: "IX"
  defp roman_repr(num, 5), do: String.duplicate( "V", div(num, 5) )
  defp roman_repr(num, 1) when num >= 4, do: "IV"
  defp roman_repr(num, 1), do: String.duplicate( "I", num )

  defp roman_rem(num, 500) when num >= 900, do: num - 900
  defp roman_rem(num, 100) when num >= 400, do: num - 400
  defp roman_rem(num, 50) when num >= 90, do: num - 90
  defp roman_rem(num, 10) when num >= 40, do: num - 40
  defp roman_rem(num, 5) when num >= 9, do: num - 9
  defp roman_rem(num, x), do: rem(num, x)
end
