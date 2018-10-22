defmodule Bob do
  @type phrase :: String.t

  @spec hey(phrase) :: String.t
  def hey(input) do
    cond do
      empty_phrase?(input) ->
        "Fine. Be that way!"

      upcase_letters?(input) and question?(input) ->
        "Calm down, I know what I'm doing!"

      upcase_letters?(input) ->
        "Whoa, chill out!"

      question?(input) ->
        "Sure."

      true ->
        "Whatever."
    end
  end

  # Checks if a phrase is empty. Ex. "", "  "
  @spec empty_phrase?(phrase) :: boolean
  defp empty_phrase?(p) do
    p |> String.trim() |> String.length() == 0
  end

  # Checks if every letter in a phrase is capitalized.
  @spec upcase_letters?(phrase) :: boolean
  defp upcase_letters?(p) do
    String.upcase(p) == p and String.downcase(p) != p
  end

  # Checks if a phrase is a question.
  @spec question?(phrase) :: boolean
  defp question?(p) do
    String.ends_with?(p, "?")
  end
end
