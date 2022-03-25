defmodule KanaRomanTest do
  use ExUnit.Case
  doctest KanaRoman

  describe "to_roman/1" do
    @patterns [
      {"nukosuke", "ヌコスケ"},
      {"tamura", "タムラ"},
      {"yosuke", "ヨウスケ"},
      {"ryosuke", "リョウスケ"},
      {"ando", "アンドウ"},
      {"hattori", "ハットリ"}
    ]

    for {expected, katakana} <- @patterns do
      test "convert correctly: #{katakana} to #{expected}" do
        assert {:ok, unquote(expected)} = KanaRoman.to_roman(unquote(katakana))
      end
    end
  end
end
