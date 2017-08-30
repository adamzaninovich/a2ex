use Mix.Config

config :a2ex, A2ex.Robot,
  adapter: Alice.Adapters.Slack,
  slack_token: System.get_env("LAASY_SLACK_KEY"),
  name: "alice",
  log_level: :debug,
  handlers: [A2ex.Random]

# import_config "#{Mix.env}.exs"
