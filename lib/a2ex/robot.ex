defmodule A2ex.Robot do
  use Alice.Bot, otp_app: :a2ex

  def handle_connect(%{name: name} = state) do
    if :undefined == :global.whereis_name(name) do
      :yes = :global.register_name(name, self())
    end

    {:ok, state}
  end

  def whereis(name) do
    :global.whereis_name(name)
  end
end
