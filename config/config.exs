import Config

config :opentelemetry, :resource, service: %{name: "opentelemetry_setup"}

config :opentelemetry,
       :processors,
       otel_batch_processor: %{
         exporter: {:opentelemetry_exporter, %{endpoints: [{:http, 'localhost', 55681, []}]}}
       }
