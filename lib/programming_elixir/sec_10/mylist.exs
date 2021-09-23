defmodule MyList do
  def all?(list), do: all?(list, fn x -> !!x end)
  def all?([], _func), do: true
  def all?([ head | tail ], func) do
    if func.(head) do
      all?(tail, func)
    else
      false
    end
  end

  def each([], _func), do: []
  def each([ head | tail ], func) do
    [ func.(head) | each(tail, func) ]
  end

  def filter([], _func), do: []
  def filter([ head | tail ], func) do
    if func.(head) do
      [ head | filter(tail, func)]
    else
      [ filter(tail, func) ]
    end
  end

  def reverse([]), do: []
  def reverse([ head | tail ]) do
    reverse(tail) ++ [head]
  end

  def split(list, num), do: _split(list, [], num)
  defp _split([], front, _), do: [reverse(front), []]
  defp _split(tail, front, 0), do: [reverse(front), tail]
  defp _split([ head | tail ], front, num) do
    _split(tail, [ head | front ], num-1)
  end

  def flatten_using_concat([]), do: []
  def flatten_using_concat([ head | tail ]) do
    flatten_using_concat(head) ++ flatten_using_concat(tail)
  end
  def flatten_using_concat(head), do: [head]

  def flatten(list), do: _flatten(list, [])
  defp _flatten([], result), do: reverse(result)
  defp _flatten([ [ h | [] ] | tail ], result) do
    _flatten([ h | tail ], result)
  end
  defp _flatten([ [ h | t ] | tail ], result) do
    _flatten([ h, t | tail ], result)
  end
  defp _flatten([ head | tail ], result) do
    _flatten(tail, [ head | result ])
  end
end
