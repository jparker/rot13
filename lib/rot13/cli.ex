defmodule Rot13.CLI do
  @moduledoc """
  CLI for Rot13.
  """

  @doc """
  Applies `Rot13.encode/1` to each command line argument and prints the results.
  """

  def main([]) do
    IO.write """
    usage: rot13 word [word ...]
    """
  end

  def main(argv) do
    argv
    |> Enum.map(&Rot13.encode/1)
    |> Enum.join(" ")
    |> IO.puts()
  end
end
