defmodule OpentelemetrySetup.Demo do
  require OpenTelemetry.Tracer, as: Tracer

  def call() do
    Tracer.with_span "#{__MODULE__}.call/0" do
      work1()
    end
  end

  defp work1 do
    Tracer.with_span "#{__MODULE__}.work1/0" do
      IO.puts("1")
      work2()
    end
  end

  defp work2 do
    Tracer.with_span "#{__MODULE__}.work2/0" do
      IO.puts("2")
      work3()
    end
  end

  defp work3 do
    Tracer.with_span "#{__MODULE__}.work3/0" do
      IO.puts("3")
      work4("value", %{random: :rand.uniform()})
    end
  end

  defp work4(value, args) do
    Tracer.with_span "#{__MODULE__}.work4/0" do
      Tracer.set_attribute(:value, value)
      Tracer.set_attributes(args)
      IO.puts("4")
      :ok
    end
  end
end
