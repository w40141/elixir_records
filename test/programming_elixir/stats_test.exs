defmodule StatsTest do
  use ExUnit.Case

  describe "Stats on lists of ints" do
    setup  do
      [
        list: [1, 3, 5, 7, 9],
        sum: 25,
        count: 5,
      ]
    end

    test "calculates sum", fixture do
      assert ProgrammingElixir.Sec14.Stats.sum(fixture.list) == fixture.sum
    end

    test "calculates count", fixture do
      assert ProgrammingElixir.Sec14.Stats.count(fixture.list) == fixture.count
    end

    test "calculates average", fixture do
      assert ProgrammingElixir.Sec14.Stats.average(fixture.list) == fixture.sum / fixture.count
    end

  end
end
