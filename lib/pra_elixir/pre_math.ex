defmodule PraElixir.PreMath do
  def fib(n) when 0 >= n, do: 0
  def fib(1), do: 1
  def fib(n), do: fib(n - 1) + fib(n - 2)

  def fizzbuzzUpto(n) when n > 0 do
    1..n |> Enum.map(&fizzbuzz/1)
  end

  defp fizzbuzz(n) do
    _fb(n, rem(n, 3), rem(n, 5))
  end

  defp _fb(_, 0, 0), do: "FizzBuzz"
  defp _fb(_, 0, _), do: "Fizz"
  defp _fb(_, _, 0), do: "Buzz"
  defp _fb(n, _, _), do: n
end
