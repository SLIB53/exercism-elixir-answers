defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence |> parse_words() |> to_count_map()
  end

  # Case-insensitively gets words in sentence. Returned words are lowercase.
  @spec parse_words(String.t()) :: [String.t()]
  defp parse_words(sentence) do
    Regex.scan(~r/[\p{L}[:digit:]'-]+/u, sentence)
    |> Enum.map(fn [w] -> String.downcase(w) end)
  end

  # Counts the number of unique items (compared by ===) and returns a map where
  # each unique item is the key, and the value is the count.
  # Ex. ["1", "1"] returns %{"1" => 2}
  @spec to_count_map(Enum.t()) :: map
  defp to_count_map(items) do
    Enum.dedup(items)
    |> Map.new(fn uniq_item ->
      {uniq_item, Enum.count(items, &(&1 === uniq_item))}
    end)
  end
end
