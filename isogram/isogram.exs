defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t()) :: boolean
  def isogram?(sentence) do
    letters = detect_letters(sentence)
    letters == Enum.uniq(letters)
  end

  # Returns a list of letters found in a word or sentence for comparison.
  # The returned letters are normalized to lowercase.
  @spec detect_letters(String.t()) :: [String.t()]
  defp detect_letters(sentence) do
    Regex.scan(~r/\p{L}\p{M}*+/u, String.downcase(sentence))
    |> Enum.map(fn [l] -> l end)
  end
end
