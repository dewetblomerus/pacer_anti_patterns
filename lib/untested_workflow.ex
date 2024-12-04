defmodule UntestedWorkflow do
  @moduledoc """
  This module contains a pacer workflow that will fail if you run it.
  But the tests all pass because they don't actually run the workflow.
  """

  use Pacer.Workflow

  graph do
    field(:numbers)
    field(:total, resolver: &__MODULE__.total/1, dependencies: [:numbers])
  end

  def new(%{numbers: numbers}) when is_list(numbers) do
    struct!(
      __MODULE__,
      %{
        numbers: numbers
      }
    )
  end

  def total(%{some_random_key: random_value}) do
    random_value
  end
end
