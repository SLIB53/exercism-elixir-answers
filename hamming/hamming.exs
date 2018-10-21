defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance('AAGTCATA', 'TAGCGATC')
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: non_neg_integer
  def hamming_distance(strand1, strand2)
      when length(strand1) === length(strand2) do
    sum =
      Enum.zip(strand1, strand2)
      |> Enum.count(fn
        {n1, n2} -> n1 !== n2
      end)

    {:ok, sum}
  end

  def hamming_distance(_strand1, _strand2) do
    {:error, "Lists must be the same length"}
  end
end
