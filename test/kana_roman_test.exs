defmodule KanaRomanTest do
  use ExUnit.Case
  doctest KanaRoman

  describe "to_roman/1" do
    test "convert correctly" do
      assert {:ok, "nukosuke"} = "ヌコスケ" |> KanaRoman.to_roman()
      assert {:ok, "tamura"} = "タムラ" |> KanaRoman.to_roman()
      assert {:ok, "yosuke"} = "ヨウスケ" |> KanaRoman.to_roman()
      assert {:ok, "ryosuke"} = "リョウスケ" |> KanaRoman.to_roman()
      assert {:ok, "ando"} = "アンドウ" |> KanaRoman.to_roman()
      assert {:ok, "hattori"} = "ハットリ" |> KanaRoman.to_roman()
    end
  end
end
