defmodule UntestedWorkflowTest do
  @moduledoc """
  We are testing that the workflow can be built, and we test the resolver
  functions, we even use pacer assertions on the graph,
  but we never test that the workflow actually runs.
  """

  use ExUnit.Case
  use Pacer.Workflow.Testing

  test "builds the workflow" do
    assert UntestedWorkflow.new(%{numbers: [1, 2]}) ==
             %UntestedWorkflow{numbers: [1, 2]}
  end

  test "assert dependency of :field_a has no dependencies" do
    assert_dependencies(UntestedWorkflow, :numbers, [])
  end

  test "provided fields match fields from workflow" do
    assert_fields(UntestedWorkflow, [
      :numbers,
      :total
    ])
  end

  test "total resolver passes test, but it will fail the workflow" do
    assert UntestedWorkflow.sum(%{some_random_key: [2, 3]}) == 5
  end
end
