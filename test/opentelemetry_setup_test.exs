defmodule OpentelemetrySetupTest do
  use ExUnit.Case
  doctest OpentelemetrySetup

  test "greets the world" do
    assert OpentelemetrySetup.hello() == :world
  end
end
