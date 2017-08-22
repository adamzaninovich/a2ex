use Mix.Config

config :a2ex, A2ex.Robot,
  adapter: Alice.Adapters.Console,
  name: "rebecca",
  log_level: :debug,
  handlers: [
    Alice.Handlers.Help,
    Alice.Handlers.Utils,
    A2ex.Random
  ]

# import_config "#{Mix.env}.exs"
