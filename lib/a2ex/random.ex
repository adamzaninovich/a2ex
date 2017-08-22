defmodule A2ex.Random do
  use Alice.Handler

  command ~r/flip a coin$/i, :flip

  def flip(msg, _state) do
    chance_reply(msg, 0.5, "heads", "tails")
  end
end
