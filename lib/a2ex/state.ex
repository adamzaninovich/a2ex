defmodule A2ex.State do
  use Agent

  def start_link(_) do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def get_all(), do: Agent.get(__MODULE__, &(&1))

  def get(key, fun, default) when is_function(fun) do
    Agent.get(__MODULE__, fn(state) ->
      fun.(Map.get(state, key, default))
    end)
  end

  def get(key, default\\nil) do
    get(key, &(&1), default)
  end

  def put(key, value) do
    update(key, value, fn(_) -> value end)
  end

  def update(key, initial, fun) do
    Agent.update(__MODULE__, fn(state) ->
      Map.update(state, key, initial, fun)
    end)
  end
end
