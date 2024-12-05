# PacerAntiPatterns

### Practical example of anti-patterns using Pacer

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
