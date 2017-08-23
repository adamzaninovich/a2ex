use Mix.Config

config :a2ex, A2ex.Robot,
  adapter: Alice.Adapters.Console,
  name: "alice",
  log_level: :debug,
  handlers: [A2ex.Random]

# import_config "#{Mix.env}.exs"
