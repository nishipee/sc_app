class Category3 < ActiveHash::Base
  self.data = [
    { id: 1, name: "---" },
    { id: 2, name: "レディース" },
    { id: 3, name: "メンズ" },
    { id: 4, name: "キッズ・ベビー" },
    { id: 5, name: "バッグ" },
    { id: 6, name: "小物" },
    { id: 7, name: "靴" },
    { id: 8, name: "腕時計" },
    { id: 9, name: "ジュエリー・アクセサリー" },
    { id: 10, name: "ベビーグッズ" },
    { id: 11, name: "おもちゃ" },
    { id: 12, name: "食品" },
    { id: 13, name: "スイーツ・お菓子" },
    { id: 14, name: "水・ソフトドリンク" },
    { id: 15, name: "ビール・洋酒" },
    { id: 16, name: "日本酒・焼酎" },
    { id: 17, name: "ワイン" },
    { id: 18, name: "インテリア・収納" },
    { id: 19, name: "寝具・ベッド・マットレス" },
    { id: 20, name: "文具" },
    { id: 21, name: "ハンドメイド" },
    { id: 22, name: "食器" },
    { id: 23, name: "調理器具" },
    { id: 24, name: "美容・コスメ・香水" },
    { id: 25, name: "ダイエット・健康" },
    { id: 26, name: "医薬品・コンタクト・介護" },
    { id: 27, name: "テレビゲーム" },
    { id: 28, name: "ホビー" },
    { id: 29, name: "楽器・音楽機材" },
    { id: 30, name: "その他" }
  ]

  include ActiveHash::Associations
  has_many :products
  
end