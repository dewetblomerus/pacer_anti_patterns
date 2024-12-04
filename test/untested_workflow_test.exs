defmodule UntestedWorkflowTest do
  @moduledoc """
  None of the tests in this module are anti-patterns. The anti-pattern is
  what is missing from the tests. We are testing that the workflow can be built,
  we are testing the shape of the graph, we are testing the resolver functions,
  but we never test that the workflow actually runs.

  The point here is that you can have many beautiful tests, but if you never
  run the workflow, it is still untested.
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
