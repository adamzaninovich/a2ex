defmodule A2ex.Bot do
  use Alice.Bot, otp_app: :a2ex

  def handle_connect(%{name: name} = state) do
    with :undefined <- :global.whereis_name(name),
         :yes <- :global.register_name(name, self()) do
      {:ok, state}
    else
      _ -> raise "Unable to register bot"
    end
  end

  def pid, do: :global.whereis_name(get_config(:name))
end
