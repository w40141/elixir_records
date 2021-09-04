defmodule PreMathTest do
  use ExUnit.Case

  test "Calu fibo" do
    assert PreElixir.PreMath.fib(1) == 1
  end
end
