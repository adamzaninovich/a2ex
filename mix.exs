defmodule A2ex.Mixfile do
  use Mix.Project

  def project do
    [
      app: :a2ex,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:alice],
      mod: {A2ex.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:alice, path: "~/projects/alice/a2"}
      {:alice, github: "adamzaninovich/a2"}
    ]
  end
end
