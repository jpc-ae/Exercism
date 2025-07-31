defmodule PaintByNumber do
  def palette_bit_size(color_count), do: count_bits(color_count)

  defp count_bits(count, bits \\ 0)
  defp count_bits(count, bits) when count < 1, do: bits
  defp count_bits(count, bits) when bits == 0, do: count_bits(count - 2, bits + 1)
  defp count_bits(count, bits), do: count_bits(count - (2 ** bits), bits + 1)

  def empty_picture(), do: <<>>

  def test_picture(), do: <<0::2, 1::2, 2::2, 3::2>>

  def prepend_pixel(picture, color_count, pixel_color_index) do
    <<pixel_color_index::size(palette_bit_size(color_count)), picture::bitstring>>
  end

  def get_first_pixel(<<>>, _), do: nil
  def get_first_pixel(picture, color_count) do
    bits = palette_bit_size(color_count)
    <<first_pixel::size(bits), _rest::bitstring>> = picture
    first_pixel
  end

  def drop_first_pixel(<<>>, _), do: <<>>
  def drop_first_pixel(picture, color_count) do
    bits = palette_bit_size(color_count)
    <<_first_pixel::size(bits), rest::bitstring>> = picture
    rest
  end

  def concat_pictures(picture1, picture2), do: <<picture1::bitstring, picture2::bitstring>>
end
