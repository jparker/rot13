defmodule Rot13 do
  @moduledoc """
  Rot13 encoding of strings.
  """

  @spec encode(binary()) :: binary()
  @spec encode(charlist()) :: charlist()

  @doc """
  Apply rot13 encoding to a string. Non-alpha characters are left unchanged.

  ## Examples

      iex> Rot13.encode("elixir")
      "ryvkve"

      iex> Rot13.encode('elixir')
      'ryvkve'
  """

  def encode(str) when is_binary(str) do
    str
    |> String.to_charlist
    |> encode()
    |> List.to_string()
  end

  def encode(chars) do
    Enum.map(chars, &transform/1)
  end

  defp transform(chr) when chr in ?a..?z, do: rotate(chr, ?a)
  defp transform(chr) when chr in ?A..?Z, do: rotate(chr, ?A)
  defp transform(chr), do: chr

  defp rotate(chr, base), do: base + rem(chr - base + 13, 26)
end
