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
      {"hattori", "ハットリ"},
      {"juwhon", "ジュウォン"},
      {"vindika", "ヴィンヂカ"},
      {"hoxonbai", "ホォンバイ"},
      {"dovoruzaku", "ドヴォルザーク"},
      {"fuxuxan", "フゥァン"},
      {"kyaxyan", "キャャン"}
    ]

    for {expected, katakana} <- @patterns do
      test "convert correctly: #{katakana} to #{expected}" do
        assert {:ok, unquote(expected)} = KanaRoman.to_roman(unquote(katakana))
      end
    end
  end
end
