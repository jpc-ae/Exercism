defmodule ProteinTranslation do
  @cysteine "Cysteine"
  @leucine "Leucine"
  @methionine "Methionine"
  @phenylalanine "Phenylalanine"
  @serine "Serine"
  @tryptophan "Tryptophan"
  @tyrosine "Tyrosine"
  @stop "STOP"

  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {:ok, list(String.t())} | {:error, String.t()}
  def of_rna(""), do: {:ok, []}
  def of_rna(rna), do: parse_rna(rna, [])

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
  def of_codon(codon) do
    with {:ok, [protein | _]} <- parse_rna(codon, []) do
      {:ok, protein}
    else
      {:ok, []} -> {:ok, "STOP"}
      _ -> {:error, "invalid codon"}
    end
  end

  defp parse_rna("", proteins), do: {:ok, Enum.reverse(proteins)}
  defp parse_rna("UGU" <> rest, proteins), do: parse_rna(rest, [@cysteine | proteins])
  defp parse_rna("UGC" <> rest, proteins), do: parse_rna(rest, [@cysteine | proteins])
  defp parse_rna("UUA" <> rest, proteins), do: parse_rna(rest, [@leucine | proteins])
  defp parse_rna("UUG" <> rest, proteins), do: parse_rna(rest, [@leucine | proteins])
  defp parse_rna("AUG" <> rest, proteins), do: parse_rna(rest, [@methionine | proteins])
  defp parse_rna("UUU" <> rest, proteins), do: parse_rna(rest, [@phenylalanine | proteins])
  defp parse_rna("UUC" <> rest, proteins), do: parse_rna(rest, [@phenylalanine | proteins])
  defp parse_rna("UCU" <> rest, proteins), do: parse_rna(rest, [@serine | proteins])
  defp parse_rna("UCC" <> rest, proteins), do: parse_rna(rest, [@serine | proteins])
  defp parse_rna("UCA" <> rest, proteins), do: parse_rna(rest, [@serine | proteins])
  defp parse_rna("UCG" <> rest, proteins), do: parse_rna(rest, [@serine | proteins])
  defp parse_rna("UGG" <> rest, proteins), do: parse_rna(rest, [@tryptophan | proteins])
  defp parse_rna("UAU" <> rest, proteins), do: parse_rna(rest, [@tyrosine | proteins])
  defp parse_rna("UAC" <> rest, proteins), do: parse_rna(rest, [@tyrosine | proteins])
  defp parse_rna("UAA" <> _, proteins), do: {:ok, Enum.reverse(proteins)}
  defp parse_rna("UAG" <> _, proteins), do: {:ok, Enum.reverse(proteins)}
  defp parse_rna("UGA" <> _, proteins), do: {:ok, Enum.reverse(proteins)}
  defp parse_rna(_, _), do: {:error, "invalid RNA"}
end