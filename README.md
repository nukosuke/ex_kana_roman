# KanaRoman
[![hex.pm](https://img.shields.io/hexpm/v/kana_roman)](https://hex.pm/packages/kana_roman)
[![CI](https://github.com/nukosuke/ex_kana_roman/actions/workflows/ci.yml/badge.svg)](https://github.com/nukosuke/ex_kana_roman/actions/workflows/ci.yml)
[![MIT License](https://img.shields.io/hexpm/l/kana_roman)](./LICENSE)

カタカナ => ローマ字 変換

## Usage

```ex
iex(1)> KanaRoman.to_roman("ヌコスケ")
{:ok, "nukosuke"}
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `kana_roman` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:kana_roman, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/kana_roman](https://hexdocs.pm/kana_roman).

## License

MIT License
See the file [LICENSE](./LICENSE)
