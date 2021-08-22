class Charge < ActiveHash::Base
  self.data = [
    { id: 1, name: "---" },
    { id: 2, name: "送料無料" },
    { id: 3, name: "全国一律送料: 500円"},
    { id: 4, name: "同店舗で5,000円以上のご注文で送料無料" }
  ]

  include ActiveHash::Associations
  has_many :products
  
end