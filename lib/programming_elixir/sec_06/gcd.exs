defmodule Gcd do
  def of(0, 0), do: 0
  def of(x, 0), do: x
  def of(x, y), do: of(y, rem(x, y))
end
