defmodule A2ex.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      {A2ex.State, []},
      {A2ex.Bot, []}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: A2ex.Supervisor)
  end
end
