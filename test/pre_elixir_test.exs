defmodule PreElixirTest do
  use ExUnit.Case
  doctest PreElixir

  test "greets the world" do
    assert PreElixir.hello() == :world
  end
end
