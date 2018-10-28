defmodule Binary do
  @doc """
  Convert a string containing a binary number to an integer.

  On errors returns 0.
  """
  @spec to_decimal(String.t()) :: non_neg_integer
  def to_decimal(string) do
    try do
      string |> parse_tokens() |> tokens_to_integer()
    rescue
      _e in ArgumentError -> 0
    end
  end

  @spec parse_tokens(String.t()) :: [integer]
  defp parse_tokens(string) do
    Enum.map(to_charlist(string), fn
      ?0 -> 0
      ?1 -> 1
      _ -> raise ArgumentError
    end)
  end

  @spec tokens_to_integer([integer]) :: integer
  defp tokens_to_integer(tokens) do
    Enum.zip(tokens, (length(tokens) - 1)..0)
    |> Enum.map(fn {t, exp} -> t * round(:math.pow(2, exp)) end)
    |> Enum.sum()
  end
end
