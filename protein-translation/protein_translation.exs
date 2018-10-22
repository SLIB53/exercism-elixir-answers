defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna(rna) do
    String.to_charlist(rna)
    |> Stream.chunk_every(3)
    |> Enum.reduce_while({:ok, _acc_proteins = []}, fn rna_chunk, acc ->
      case rna_chunk do
        c = [_l1, _l2, _l3] ->
          case of_codon(to_string(c)) do
            {:ok, "STOP"} ->
              {:halt, acc}

            {:ok, protein} ->
              {:ok, acc_p} = acc
              {:cont, {:ok, acc_p ++ [protein]}}

            {:error, _} ->
              {:halt, {:error, "invalid RNA"}}
          end

        _ ->
          {:halt, {:error, "invalid RNA"}}
      end
    end)
  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: {atom, String.t()}

  def of_codon("UGU"), do: {:ok, "Cysteine"}

  def of_codon("UGC"), do: {:ok, "Cysteine"}

  def of_codon("UUA"), do: {:ok, "Leucine"}

  def of_codon("UUG"), do: {:ok, "Leucine"}

  def of_codon("AUG"), do: {:ok, "Methionine"}

  def of_codon("UUU"), do: {:ok, "Phenylalanine"}

  def of_codon("UUC"), do: {:ok, "Phenylalanine"}

  def of_codon("UCU"), do: {:ok, "Serine"}

  def of_codon("UCC"), do: {:ok, "Serine"}

  def of_codon("UCA"), do: {:ok, "Serine"}

  def of_codon("UCG"), do: {:ok, "Serine"}

  def of_codon("UGG"), do: {:ok, "Tryptophan"}

  def of_codon("UAU"), do: {:ok, "Tyrosine"}

  def of_codon("UAC"), do: {:ok, "Tyrosine"}

  def of_codon("UAA"), do: {:ok, "STOP"}

  def of_codon("UAG"), do: {:ok, "STOP"}

  def of_codon("UGA"), do: {:ok, "STOP"}

  def of_codon(_codon) do
    {:error, "invalid codon"}
  end
end
