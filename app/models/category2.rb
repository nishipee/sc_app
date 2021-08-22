class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: "---" },
    { id: 2, name: "ファッション" },
    { id: 3, name: "ファッション小物" },
    { id: 4, name: "キッズ・ベビー" },
    { id: 5, name: "スポーツ用品" },
    { id: 6, name: "食品" },
    { id: 7, name: "ドリンク・お酒" },
    { id: 8, name: "インテリア・寝具" },
    { id: 9, name: "日用雑貨・キッチン用品" },
    { id: 10, name: "コスメ・健康" },
    { id: 11, name: "ホビー" },
    { id: 12, name: "ペット" },
    { id: 13, name: "その他" }
  ]

  include ActiveHash::Associations
  has_many :products
  
end