defmodule Rot13Test do
  use ExUnit.Case
  doctest Rot13

  test "lowercase transformation" do
    assert "ryvkve" == Rot13.encode("elixir")
  end

  test "uppercase transformation" do
    assert "Ryvkve" == Rot13.encode("Elixir")
  end

  test "ignore non alphabetic characters" do
    assert "uryyb ahefr!" == Rot13.encode("hello nurse!")
  end

  test "encoding a string twice returns the original string" do
    assert "elixir" == "elixir" |> Rot13.encode |> Rot13.encode
    assert "Elixir" == "Elixir" |> Rot13.encode |> Rot13.encode
  end
end
