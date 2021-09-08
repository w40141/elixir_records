defmodule MyMath do
  def combination(_, 0), do: [[]]
  def combination([], _), do: []

  def combination([x | xs], n) do
    for(y <- combination(xs, n - 1), do: [x | y]) ++ combination(xs, n)
  end

  def permutation(_, 0), do: [[]]

  def permutation(list, n) do
    for x <- list, rest <- permutation(list -- [x], n - 1), do: [x | rest]
  end

  def collatz(n) do
    [n | _collatz_even(rem(n, 2) == 0, n)]
  end

  defp _collatz_even(_, 1), do: []
  defp _collatz_even(true, n), do: collatz(div(n, 2))
  defp _collatz_even(false, n), do: collatz(3 * n + 1)
end
