defmodule A2exTest do
  use ExUnit.Case
  doctest A2ex

  test "greets the world" do
    assert A2ex.hello() == :world
  end
end
