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

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {OpentelemetrySetup.Application, []},
      extra_applications: [:logger, :tls_certificate_check]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:opentelemetry_api, "~> 1.0"},
      {:opentelemetry, "~> 1.0"},
      {:opentelemetry_exporter, "~> 1.0"},
      {:tls_certificate_check, "~> 1.13"}
    ]
  end
end
