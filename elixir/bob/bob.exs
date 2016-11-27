defmodule Bob do
  def hey(input) do
    cond do
      input =~ ~r/^\s*$/x -> "Fine. Be that way!"
      String.upcase(input) == input && input =~ ~r/^.*[\p{Lu}]+.*/ -> "Whoa, chill out!"
      input =~ ~r/.*\?$/ -> "Sure."
      true -> "Whatever."
    end
  end
end
