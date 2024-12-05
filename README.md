# PacerAntiPatterns

### Practical examples of anti-patterns using Pacer

### Motivation

Let me start by saying that I am a huge fan of Pacer. If you have many
datapoints that depend on each other in a way that you can't hold in your head
then a Pacer workflow is an excellent way to manage the chaos, you can focus
on one datapoint at a time and list out it's dependencies. Pacer will figure
out the order of execution.

I also like the performance improvements that can be gained when some of those
datapoints can be fetched in Parallel.

My reason for creating this repo was because I wanted to clearly communicate
my intent and not come across like I am Poopooing on Pacer. I just want to make
sure we are not using it in scenarios where it does not have the opportunity
to shine.

### How to run the tests

```
mix test
```

### How to run the benchmark

```elixir
Benchee.run(
  %{
    "workflow" => &CompiledBenchmark.workflow/0,
    "module" => &CompiledBenchmark.module/0
    },
  time: 10,
  memory_time: 2
)
```
