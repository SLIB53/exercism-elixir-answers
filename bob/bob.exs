defmodule Bob do
  def hey(input) do
    cond do
      (input |> String.trim |> String.length) == 0 ->   # empty
        "Fine. Be that way!"

      has_only_capital_letters?(input) ->               # yelled...
        if String.ends_with?(input, "?") do               # yelled question
          "Calm down, I know what I'm doing!"
        else                                              # yelled
          "Whoa, chill out!"
        end

      String.ends_with?(input, "?") ->                  # asked question
        "Sure."

      true ->
        "Whatever."
    end
  end

  #
  # String parsing library
  #

  def is_only_capital_letters?(string) do
    case String.trim(string) != "" do
      true ->
        String.graphemes(string)
        |> Enum.all?(fn c -> String.downcase(c) != c end)
      false ->
        false
    end
  end

  def has_only_capital_letters?(string) do
    is_only_capital_letters?(
      _letters = 
        Regex.scan(~r/\p{L}/u, string)
        |> List.flatten
        |> List.to_string
    )
  end
end
