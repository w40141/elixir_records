defmodule Greeter do
  def for(name, greeting) do
    fn
      (^name) -> "#{greeting} #{name}"
      (_) -> "I don't know you."
    end
  end
end

mr_value = Greeter.for("Jose", "Oi!")

IO.puts(mr_value.("Jose"))
IO.puts(mr_value.("Dave"))
