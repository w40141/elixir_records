defmodule StatsPropertyTest do
  use ExUnit.Case
  use ExUnitProperties

  describe "Stats on lists of ints" do
    property "count not negative" do
      check all(l <- list_of(integer())) do
        assert ProgrammingElixir.Sec14.Stats.count(l) >= 0
      end
    end

    property "single element lists are their own sum" do
      check all(number <- integer()) do
        assert ProgrammingElixir.Sec14.Stats.sum([number]) == number
      end
    end

    property "sum equals average times count (nomempty)" do
      check all(l <- list_of(integer()) |> nonempty) do
        assert_in_delta(
          ProgrammingElixir.Sec14.Stats.sum(l),
          ProgrammingElixir.Sec14.Stats.count(l) * ProgrammingElixir.Sec14.Stats.average(l),
          1.0e6
        )
      end
    end

    property "sum equals average times count (min_length)" do
      check all(l <- list_of(integer(), min_length: 1)) do
        assert_in_delta(
          ProgrammingElixir.Sec14.Stats.sum(l),
          ProgrammingElixir.Sec14.Stats.count(l) * ProgrammingElixir.Sec14.Stats.average(l),
          1.0e6
        )
      end
    end
  end
end
