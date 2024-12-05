defmodule SlowWorkflow do
  @moduledoc """
  This module contains a pacer workflow that should have never been one.
  It is 3x as much code to read and write, and it is slower than the module
  to execute.
  """

  use Pacer.Workflow

  graph do
    field(:numbers)
    field(:total, resolver: &__MODULE__.sum/1, dependencies: [:numbers])
  end

  def call(%{numbers: _} = input) do
    input
    |> new()
    |> Pacer.Workflow.execute()
  end

  def new(input) do
    struct!(__MODULE__, input)
  end

  def sum(%{numbers: numbers}) do
    Enum.sum(numbers)
  end
end

defmodule FastModule do
  @moduledoc """
  This module does the same thing as the workflow above.
  """

  defstruct [:numbers, :total]

  def call(%{numbers: numbers}) do
    %__MODULE__{numbers: numbers, total: Enum.sum(numbers)}
  end
end

defmodule CompiledBenchmark do
  @moduledoc """
  Benchee compplains about using anonymous functions on super fast code,
  so this module compiles the call functions to make Benchee happy.

  Check the README.md for how to run the benchmark.
  """

  def workflow do
    SlowWorkflow.call(%{numbers: [1, 2]})
  end

  def module do
    FastModule.call(%{numbers: [1, 2]})
  end
end
