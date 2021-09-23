defmodule Chop do
  def average(a..b) do
    div((a + b), 2)
  end
  def guess(x, a..b) do
    guess = average(a..b)
    _guess(x, guess, a..b)
  end
  def _guess(x, x, _) do
    IO.puts("#{x}")
  end
  def _guess(x, guess, _..b) when guess < x do
    IO.puts("It is #{guess}")
    guess(x, (guess - 1)..b)
  end
  def _guess(x, guess, a.._) when guess > x do
    IO.puts("It is #{guess}")
    guess(x, a..(guess + 1))
  end
end
