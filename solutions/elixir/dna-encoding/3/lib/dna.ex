defmodule DNA do
  def encode_nucleotide(code_point) do
    case code_point do
      ?\s -> 0b0000
      ?A -> 0b0001
      ?C -> 0b0010
      ?G -> 0b0100
      ?T -> 0b1000
    end
  end

  def decode_nucleotide(encoded_code) do
    case encoded_code do
      0b0000 -> ?\s
      0b0001 -> ?A
      0b0010 -> ?C
      0b0100 -> ?G
      0b1000 -> ?T
    end
  end

  def encode(dna), do: do_encode(dna, <<>>)
  defp do_encode([], acc), do: acc
  defp do_encode([entry | list], acc), do: do_encode(list, <<acc::bitstring, encode_nucleotide(entry)::4>>)

  def decode(dna), do: do_decode(dna, [])
  defp do_decode(<<>>, acc), do: reverse_list(acc, [])
  defp do_decode(<<entry::4, rest::bitstring>>, acc), do: do_decode(rest, [decode_nucleotide(entry) | acc])

  defp reverse_list([], acc), do: acc
  defp reverse_list([head | tail], acc), do: reverse_list(tail, [head | acc])
end
