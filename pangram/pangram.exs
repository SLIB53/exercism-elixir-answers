defmodule Pangram do
  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.

  Returns a boolean.

  ## Example

  iex> Pangram.pangram?("the quick brown fox jumps over the lazy dog")
  true
  """
  @spec pangram?(String.t()) :: boolean
  def pangram?(sentence) do
    MapSet.subset?(
      MapSet.new(?a..?z),
      MapSet.new(parse_letters_and_symbols(sentence))
    )
  end

  @spec parse_letters_and_symbols(String.t()) :: charlist
  defp parse_letters_and_symbols(s) do
    s |> String.downcase() |> String.to_charlist()
  end
end
