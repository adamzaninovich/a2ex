use Mix.Config

defmodule ConfigHelper do
  def get_slack_token(:dev), do: System.get_env("LAASY_SLACK_KEY")
  def get_slack_token(_), do: System.get_env("SLACK_API_TOKEN")
end

config :a2ex, A2ex.Robot,
  adapter: Alice.Adapters.Slack,
  slack_token: ConfigHelper.get_slack_token(Mix.env),
  name: "alice",
  log_level: :debug,
  handlers: [A2ex.Random]

# import_config "#{Mix.env}.exs"
