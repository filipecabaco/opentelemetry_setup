defmodule OpentelemetrySetup.MixProject do
  use Mix.Project

  def project do
    [
      app: :opentelemetry_setup,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      mod: {OpentelemetrySetup.Application, []},
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:opentelemetry_exporter, "~> 1.0"},
      {:opentelemetry, "~> 1.0"},
      {:opentelemetry_api, "~> 1.0"}
    ]
  end
end
