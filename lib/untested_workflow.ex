defmodule UntestedWorkflow do
  @moduledoc """
  This module contains a pacer workflow that will fail if you run it.
  But the tests all pass because they don't actually run the workflow.
  """

  use Pacer.Workflow

  graph do
    field(:numbers)
    field(:total, resolver: &__MODULE__.sum/1, dependencies: [:numbers])
  end

  def new(%{numbers: numbers}) when is_list(numbers) do
    struct!(
      __MODULE__,
      %{
        numbers: numbers
      }
    )
  end

  def sum(%{some_random_key: numbers}) do
    Enum.sum(numbers)
  end
end
