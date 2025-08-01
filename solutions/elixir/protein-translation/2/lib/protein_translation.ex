defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {:ok, list(String.t())} | {:error, String.t()}
  def of_rna(rna), do: ~r/.{3}|.+/s |> Regex.split(rna, include_captures: true, trim: true) |> parse_rna([])

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
  @spec of_codon(String.t()) :: {:ok, String.t()} | {:error, String.t()}
  def of_codon(codon) when codon in ["UGU", "UGC"], do: {:ok, "Cysteine"}
  def of_codon(codon) when codon in ["UUA", "UUG"], do: {:ok, "Leucine"}
  def of_codon(codon) when codon == "AUG", do: {:ok, "Methionine"}
  def of_codon(codon) when codon in ["UUU", "UUC"], do: {:ok, "Phenylalanine"}
  def of_codon(codon) when codon in ["UCU", "UCC", "UCA", "UCG"], do: {:ok, "Serine"}
  def of_codon(codon) when codon == "UGG", do: {:ok, "Tryptophan"}
  def of_codon(codon) when codon in ["UAU", "UAC"], do: {:ok, "Tyrosine"}
  def of_codon(codon) when codon in ["UAA", "UAG", "UGA"], do: {:ok, "STOP"}
  def of_codon(_), do: {:error, "invalid codon"}

  defp parse_rna([], proteins), do: {:ok, Enum.reverse(proteins)}
  defp parse_rna([codon | _], _) when length(codon) < 3, do: {:error, "invalid RNA"}
  defp parse_rna([codon | tail], proteins) do
    case of_codon(codon) do
      {:ok, "STOP"} -> {:ok, Enum.reverse(proteins)}
      {:ok, protein} -> parse_rna(tail, [protein | proteins])
      _ -> {:error, "invalid RNA"}
    end
  end
end
