use Mix.Config

defmodule ConfigHelper do
  def get_slack_token(:dev), do: System.get_env("LAASY_SLACK_KEY")
  def get_slack_token(_), do: System.get_env("SLACK_API_TOKEN")

  def get_adapter, do: get_adapter(System.get_env("ALICE_ADAPTER"))
  def get_adapter("console"), do: Alice.Adapters.Console
  def get_adapter(_), do: Alice.Adapters.Slack
end

config :a2ex, A2ex.Bot,
  adapter: ConfigHelper.get_adapter(),
  slack_token: ConfigHelper.get_slack_token(Mix.env),
  name: "a2",
  log_level: :debug,
  handlers: [A2ex.Random]

# import_config "#{Mix.env}.exs"
