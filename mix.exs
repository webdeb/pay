defmodule Pay.Mixfile do
  use Mix.Project

  def project do
    [
      app: :pay,
      version: "0.1.4",
      elixir: "~> 1.8",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:logger, :maru, :httpoison]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [
      {:maru, "~> 0.13"},
      {:httpoison, "~> 1.0"},
      {:poison, "~> 4.0"},
      {:jason, "~> 1.1"},
      {:mock, "~> 0.1.1", only: :test},
      {:dogma, "~> 0.0", only: :dev}
    ]
  end
end
