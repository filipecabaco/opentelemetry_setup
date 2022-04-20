# Setup Jaeger and Elixir to have tracing locally

Based on the presentation from https://github.com/kamilkowalski/opentelemetry-demo

This is a simple example on how to setup a tracing environment on your Elixir project to help you during development.

## What do you need in Elixir?

Add a new application for the SSL certificate checks and add de dependencies in your `mix.exs`. Please do note that dependency order does matter to avoid a tls_certificate_check error.

```elixir
#...
defp deps do
    [
        # This order matters to avoid a tls_certificate_check
        {:opentelemetry_exporter, "~> 1.0"},
        {:opentelemetry, "~> 1.0"},
        {:opentelemetry_api, "~> 1.0"},
    #...
    ]
end
```
On your `config.exs` configuration

```elixir
config :opentelemetry, :resource, service: %{name:"app_name"}

config :opentelemetry,
       :processors,
       otel_batch_processor: %{
         exporter: {:opentelemetry_exporter, %{endpoints: [{:http, 'localhost', 55681, []}]}}
       }
```

And then instrument the areas of the code you want to measure. I suggest that the span has the Module name, the function and the arity.
```elixir
    require OpenTelemetry.Tracer, as: Tracer

    Tracer.with_span "#{__MODULE__}.function/arity" do
    end
```

You can add more metadata to each trace to the active trace using `OpenTelemetry.Tracer.set_attribute/2` or `OpenTelemetry.Tracer.set_attributes/1`, check https://hexdocs.pm/opentelemetry_api/OpenTelemetry.Tracer.html for more information.

## Setup Jaeger
Finally, `docker compose up -d` and access http://localhost:16686

Jaeger was chosen due to the fact that it's contained in a single image with no configuration file but you can check out other services like Tempo from Gragana, Elastic APM from Elastic or OpenZipkin.

## Demonstration
In this demo app, try it out by running `iex -S mix` and call `OpentelemetrySetup.Demo.call()`.

In the code you can see that we instrument multiple functions and that we add an attribute to the last span to see what args were received by the function.

![demo.png](demo.png)
