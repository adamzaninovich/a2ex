defmodule A2ex.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    {:ok, bot} = Alice.start_bot(A2ex.Bot, [])
    Process.register(bot, A2ex.Bot)

    :observer.start()

    Supervisor.start_link([
      {A2ex.State, []}
    ], strategy: :one_for_one, name: A2ex.Supervisor)
  end
end
