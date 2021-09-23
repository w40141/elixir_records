defmodule MyList do
  def len([]), do: 0
  def len([_head | tail]), do: 1 + len(tail)
  def square([]), do: []
  def square([head | tail]), do: [ head * head | square(tail) ]
  def add_1([]), do: []
  def add_1([head | tail]), do: [head + 1 | add_1(tail)]
  def map([], _func), do: []
  def map([head | tail], func), do: [func.(head) | map(tail, func)]
  def reduce([], value, _func) do
    value
  end
  def reduce([head | tail], value, func) do
    reduce(tail, func.(head, value), func)
  end
  def mapsum([head | tail], func) do
    sum(map([head | tail], func))
  end
  def sum([]) do
    0
  end
  def sum([head | tail]) do
    head + sum(tail)
  end
  def max([]) do
    0
  end
  def max([a]) do
    a
  end
  def max([head | tail]) do
    b = max(tail)
    if (head < b), do: b, else: head
  end
  def span(b, a) when a < b, do: []
  def span(a, a), do: []
  def span(b, a) do
    [b] ++ span(b+1, a)
  end
end
