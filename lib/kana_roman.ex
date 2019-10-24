defmodule KanaRoman do
  @moduledoc """
  カタカナをローマ字表記に変換するモジュール。
  """

  @triple_katakana_map %{
    "キュウ" => "kyu",
    "キョウ" => "kyo",
    "シュウ" => "shu",
    "ショウ" => "sho",
    "チュウ" => "chu",
    "チョウ" => "cho",
    "ニュウ" => "nyu",
    "ニョウ" => "nyo",
    "ヒュウ" => "hyu",
    "ヒョウ" => "hyo",
    "ミュウ" => "myu",
    "ミョウ" => "myo",
    "リュウ" => "ryu",
    "リョウ" => "ryo"
  }

  @double_katakana_map %{
    "キャ" => "kya",
    "キュ" => "kyu",
    "キョ" => "kyo",
    "シャ" => "sha",
    "シュ" => "shu",
    "ショ" => "sho",
    "チャ" => "cha",
    "チュ" => "chu",
    "チョ" => "cho",
    "ニャ" => "nya",
    "ニュ" => "nyu",
    "ニョ" => "nyo",
    "ヒャ" => "hya",
    "ヒュ" => "hyu",
    "ヒョ" => "hyo",
    "ミャ" => "mya",
    "ミュ" => "myu",
    "ミョ" => "myo",
    "ギャ" => "gya",
    "ギュ" => "gyu",
    "ギョ" => "gyo",
    "ジャ" => "ja",
    "ジュ" => "ju",
    "ジョ" => "jo",
    "ビャ" => "bya",
    "ビュ" => "byu",
    "ビョ" => "byo",
    "ピャ" => "pya",
    "ピュ" => "pyu",
    "ピョ" => "pyo",
    "オウ" => "o",
    "クウ" => "ku",
    "コウ" => "ko",
    "スウ" => "su",
    "ソウ" => "so",
    "ツウ" => "tsu",
    "トウ" => "to",
    "ヌウ" => "nu",
    "ノウ" => "no",
    "フウ" => "fu",
    "ホウ" => "ho",
    "ムウ" => "mu",
    "モウ" => "mo",
    "ユウ" => "yu",
    "ヨウ" => "yo",
    "ルウ" => "ru",
    "ロウ" => "ro",
    "グウ" => "gu",
    "ゴウ" => "go",
    "ズウ" => "zu",
    "ゾウ" => "zo",
    "ヅウ" => "du",
    "ドウ" => "do",
    "ブウ" => "bu",
    "ボウ" => "bo",
    "プウ" => "pu",
    "ポウ" => "po"
  }

  @single_katakana_map %{
    "ア" => "a",
    "イ" => "i",
    "ウ" => "u",
    "エ" => "e",
    "オ" => "o",
    "カ" => "ka",
    "キ" => "ki",
    "ク" => "ku",
    "ケ" => "ke",
    "コ" => "ko",
    "サ" => "sa",
    "シ" => "shi",
    "ス" => "su",
    "セ" => "se",
    "ソ" => "so",
    "タ" => "ta",
    "チ" => "chi",
    "ツ" => "tsu",
    "テ" => "te",
    "ト" => "to",
    "ナ" => "na",
    "ニ" => "ni",
    "ヌ" => "nu",
    "ネ" => "ne",
    "ノ" => "no",
    "ハ" => "ha",
    "ヒ" => "hi",
    "フ" => "fu",
    "ヘ" => "he",
    "ホ" => "ho",
    "マ" => "ma",
    "ミ" => "mi",
    "ム" => "mu",
    "メ" => "me",
    "モ" => "mo",
    "ヤ" => "ya",
    "ユ" => "yu",
    "ヨ" => "yo",
    "ラ" => "ra",
    "リ" => "ri",
    "ル" => "ru",
    "レ" => "re",
    "ロ" => "ro",
    "ワ" => "wa",
    "ヲ" => "wo",
    "ン" => "n",
    "ガ" => "ga",
    "ギ" => "gi",
    "グ" => "gu",
    "ゲ" => "ge",
    "ゴ" => "go",
    "ザ" => "za",
    "ジ" => "ji",
    "ズ" => "zu",
    "ゼ" => "ze",
    "ゾ" => "zo",
    "ダ" => "da",
    "ヂ" => "di",
    "ヅ" => "zu",
    "デ" => "de",
    "ド" => "do",
    "バ" => "ba",
    "ビ" => "bi",
    "ブ" => "bu",
    "ベ" => "be",
    "ボ" => "bo",
    "パ" => "pa",
    "ピ" => "pi",
    "プ" => "pu",
    "ペ" => "pe",
    "ポ" => "po",
    "ー" => ""
  }

  @doc """
  カタカナをローマ字表記に変換する。

  ## Examples

      iex> "アイウエオ" |> KanaRoman.to_roman()
      {:ok, "aiueo"}

  """
  # 促音は次のアルファベットを重ねる必要があるのでオプションを渡す
  def to_roman("ッ" <> rest, acc, false), do: to_roman(rest, acc, true)

  [@triple_katakana_map, @double_katakana_map, @single_katakana_map]
  |> Enum.each(fn kmap ->
    kmap
    |> Enum.each(fn {jstr, roman} ->
      def to_roman(unquote(jstr) <> rest, acc, sokuon) do
        if sokuon,
          do: to_roman(rest, acc <> String.at(unquote(roman), 0) <> unquote(roman), false),
          else: to_roman(rest, acc <> unquote(roman), false)
      end
    end)
  end)

  def to_roman(jstr), do: to_roman(jstr, "", false)
  def to_roman("", acc, _), do: {:ok, acc}

  def to_roman(unknown, acc, _),
    do:
      {:error, :undefined_kana_roman_map,
       "Undefined Katakana to Roman conversion: #{acc} _#{unknown}_"}
end
