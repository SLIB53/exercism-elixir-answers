defmodule Bob do
  def hey(input) do
    cond do
      # empty
      input |> String.trim() |> String.length() == 0 ->
        "Fine. Be that way!"

      # yelled
      has_only_capital_letters?(input) ->
        if String.ends_with?(input, "?") do
          "Calm down, I know what I'm doing!"
        else
          "Whoa, chill out!"
        end

      # asked question
      String.ends_with?(input, "?") ->
        "Sure."

      true ->
        "Whatever."
    end
  end

  #
  # String parsing library
  #

  defp is_only_capital_letters?(string) do
    case String.trim(string) != "" do
      true ->
        String.graphemes(string)
        |> Enum.all?(fn c -> String.downcase(c) != c end)

      false ->
        false
    end
  end

  defp has_only_capital_letters?(string) do
    is_only_capital_letters?(
      _letters =
        Regex.scan(~r/\p{L}/u, string)
        |> List.flatten()
        |> List.to_string()
    )
  end
end
