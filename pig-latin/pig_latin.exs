defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    String.split(phrase) |> Enum.map_join(" ", &translate_word/1)
  end

  # Given a `word`, translates it to pig latin.
  @spec translate(phrase :: String.t()) :: String.t()
  defp translate_word(word) do
    case analyze_start(word) do
      {:ok, :vowel, _start, _rest} ->
        append_ay(word)

      {:ok, :like_vowel, start, rest} ->
        case analyze_start(rest) do
          {:ok, :vowel, _, _} ->
            translate_word(rest <> start)

          {:ok, :consonant, _, _} ->
            append_ay(word)
        end

      {:ok, :consonant, start, rest} ->
        translate_word(rest <> start)
    end
  end

  # Add "ay" to end of string.
  @spec append_ay(word :: String.t()) :: String.t()
  defp append_ay(word), do: word <> "ay"

  # Inspect the start of a string for pig latin rules.
  @spec analyze_start(word :: String.t()) ::
          {:ok, :vowel | :like_vowel | :consonant, String.t(), String.t()}
  defp analyze_start("a" <> rest), do: {:ok, :vowel, "a", rest}
  defp analyze_start("e" <> rest), do: {:ok, :vowel, "e", rest}
  defp analyze_start("i" <> rest), do: {:ok, :vowel, "i", rest}
  defp analyze_start("o" <> rest), do: {:ok, :vowel, "o", rest}
  defp analyze_start("u" <> rest), do: {:ok, :vowel, "u", rest}
  defp analyze_start("x" <> rest), do: {:ok, :like_vowel, "x", rest}
  defp analyze_start("y" <> rest), do: {:ok, :like_vowel, "y", rest}
  defp analyze_start("qu" <> rest), do: {:ok, :consonant, "qu", rest}

  defp analyze_start(word) do
    {h, t} = String.split_at(word, 1)
    {:ok, :consonant, h, t}
  end
end
