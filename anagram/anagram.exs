defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    Enum.filter(
      candidates,
      &(different_words?(&1, base) and hash(&1) == hash(base))
    )
  end

  @doc """
  The identity of a word where anagrams are binned together.
    Ex.
      true = hash("owl") == hash("low")
      true = hash("OWL") == hash("low")
  """
  @spec hash(String.t()) :: binary
  def hash(w) do
    w |> String.downcase() |> String.to_charlist() |> Enum.sort() |> to_string()
  end

  # Case-insensitively checks if two words are different.
  @spec different_words?(String.t(), String.t()) :: boolean
  defp different_words?(a, b) do
    String.downcase(a) != String.downcase(b)
  end
end
