defmodule KanaRoman.MixProject do
  use Mix.Project

  def project do
    [
      app: :kana_roman,
      version: "0.0.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      description: "カタカナ => ローマ字 変換",
      package: package(),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  def package do
    [
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/nukosuke/ex_kana_roman"}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end
end
