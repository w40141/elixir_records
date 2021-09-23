defmodule MyString do

  def printable_ascii(sqs) do
    Enum.all?(sqs, fn str -> str in ?\s..?~ end)
  end

  def anagram?(word1, word2) do
    Enum.sort(word1) == Enum.sort(word2)
  end

  def number([ ?- | tail ]), do: _number_digits(tail, 0) * -1
  def number([ ?+ | tail ]), do: _number_digits(tail, 0)
  def number(str), do: _number_digits(str, 0)

  defp _number_digits([], value), do: value
  defp _number_digits([ ?\s | tail ], value), do: _number_digits(tail, value)
  defp _number_digits([ digit | tail ], value) when digit in '0123456789' do
    _number_digits(tail, value * 10 + digit - ?0)
  end
  defp _number_digits([ non_digit | _ ], _) do
    raise "Invalid digit '#{[non_digit]}'"
  end

  def calculate(sqs), do: _calculate(sqs, 0, 0)
  defp _calculate([], value, 0), do: value
  defp _calculate([], _, ans), do: ans
  defp _calculate([ ?\s | tail ], value,  ans), do: _calculate(tail, value, ans)
  defp _calculate([ digit | tail ], value, ans) when digit in '0123456789' do
    _calculate(tail, value * 10 + digit - ?0, ans)
  end
  defp _calculate([ ?+ | tail ], value, ans), do: _calculate(tail, 0, value + ans)
  defp _calculate([ ?- | tail ], value, ans), do: _calculate(tail, 0, value - ans)
  defp _calculate([ ?* | tail ], value, ans), do: _calculate(tail, 0, value * ans)
  defp _calculate([ ?/ | tail ], value, ans), do: _calculate(tail, 0, div(value, ans))

  def capitalize_sentences(strings) do
    strings
    |> String.split(~r{\.\s+})
    |> Enum.map(&String.capitalize(&1))
    |> Enum.join(". ")
  end

end
