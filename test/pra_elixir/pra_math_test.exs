defmodule PraMathTest do
  use ExUnit.Case

  test "Calu fibo" do
    assert PraElixir.PraMath.fib(1) == 1
  end
end
