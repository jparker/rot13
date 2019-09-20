defmodule Rot13.CLI do
  def main(argv) do
    argv
    |> Enum.map(&Rot13.encode/1)
    |> Enum.join(" ")
    |> IO.puts()
  end
end
