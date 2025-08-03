defmodule RnaTranscription do
  @rna_pairs %{?G => ?C, ?C => ?G, ?T => ?A, ?A => ?U}
  
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

    iex> RnaTranscription.to_rna(~c"ACTG")
    ~c"UGAC"
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna), do: Enum.map(dna, & Map.get(@rna_pairs, &1, 0))
end
