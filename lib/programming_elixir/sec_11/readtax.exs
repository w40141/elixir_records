defmodule ReadTax do

  def read(filename) do
    file = File.open!(filename)
    headers = read_headers(IO.read(file, :list))
    Enum.map(IO.stream(file), &create_one_row(headers, &1))
  end

  def read_headers(hdr_line) do
    from_csv_and_map(hdr_line, &binding_to_atom(&1))
  end

  def create_one_row(headers, row_csv) do
    row = from_csv_and_map(row_csv, &maybe_convert_numbers(&1))
    Enum.zip(headers, row)
  end

  def from_csv_and_map(row_csv, mapper) do
    row_csv
    |> String.strip
    |> String.split(~r{,\s*})
    |> Enum.map(mapper)
  end

  def maybe_convert_numbers(value) do
    cond do
      Regex.match?(~r{^\d+$}, value) -> binary_to_integer(value)
      Regex.match?(~r{^\d+\.\d+$}, value) -> binary_to_integer(value)
      << ?: ::utf8, name :: binary >> = value -> binary_to_atom(name)
      true -> value
    end
  end

end

defmodule Taxi do
  
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
