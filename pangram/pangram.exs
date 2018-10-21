defmodule Pangram do
  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.

  Returns a boolean.

    ## Examples

      iex> Pangram.pangram?("the quick brown fox jumps over the lazy dog")
      true

  """

  @spec pangram?(String.t()) :: boolean
  def pangram?(sentence) do
    sanitized =
      sentence |> String.trim |> String.downcase

    ascii_letters = Regex.scan(~r/[a-z]/, sanitized)

    num_unique_ascii_letters =
      ascii_letters |> MapSet.new |> MapSet.size

    num_unique_ascii_letters == 26
  end
end
