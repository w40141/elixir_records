defmodule PremathTest do
  use ExUnit.Case

  test "Calu fibo" do
    assert PreElixir.Premath.fib(1) == 1
  end
end
