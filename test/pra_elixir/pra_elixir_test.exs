defmodule PraElixirTest do
  use ExUnit.Case
  doctest PraElixir

  test "greets the world" do
    assert PraElixir.hello() == :world
  end
end
