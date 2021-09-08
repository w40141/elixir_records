defmodule Customer do
  defstruct name: "", company: ""
end

defmodule BugRepodt do
  defstruct owner: %Customer{}, details: "", severity: 1
end
