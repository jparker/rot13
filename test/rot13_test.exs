defmodule Rot13Test do
  use ExUnit.Case
  use ExUnitProperties
  doctest Rot13

  test "lowercase transformation" do
    assert "ryvkve" == Rot13.encode("elixir")
  end

  test "uppercase transformation" do
    assert "Ryvkve" == Rot13.encode("Elixir")
  end

  test "ignore non alphabetic characters" do
    assert "uryyb, ahefr!" == Rot13.encode("hello, nurse!")
  end

  property "encoding a string twice returns the original string" do
    check all str <- string(:alphanumeric, length: 10) do
      assert str == str |> Rot13.encode() |> Rot13.encode()
    end
  end
end
