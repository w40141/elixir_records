defmodule Num do
  
  def span(from, to) when from > to, do: []
  def span(from, to) do
    [ from | span(from - 1, to) ]
  end

  def primes_up_to(n) do
    range = span(2, n)
    for x <- range, y <- range, x <= y, x * y <= n, rem(x, y)!=0,  do: x
  end

  def orders_with_total(orders, tax_rates) do
    # for x <- orders, do: add_total_to(x, tax_rates)
    for order = [ id: _, ship_to: state, net_amount: net ] <- orders do
      tax_rate = Keyword.get(tax_rates, state, 0)
      # tax = net * tax_rate
      # total = net + tax
      Keyword.put(order, :total_amount, net * (1 + tax_rate))
    end
  end

  def add_total_to(order = [ id: _, ship_to: state, net_amount: net ], tax_rates) do
    tax_rate = Keyword.get(tax_rates, state, 0)
    tax = net * tax_rate
    total = net + tax
    Keyword.put(order, :total_amount, total)
  end

end
