defmodule PraElixir.MyIO do
  def one_integer do
    IO.read(:line) |> String.trim() |> String.to_integer()
  end

  def one_liner_integer do
    IO.read(:line)
    |> String.trim()
    |> String.split(" ")
    |> Enum.map(&String.to_integer/1)
  end

  def multi_liner_integer do
    q = one_integer()

    for _ <- 1..q do
      one_liner_integer()
    end
  end

  def output(answer) do
    answer |> Enum.join("\n") |> IO.puts()
  end
end
