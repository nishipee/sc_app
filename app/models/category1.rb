class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: "---" },
    { id: 2, name: "動物にやさしい" },
    { id: 3, name: "環境にやさしい" },
    { id: 4, name: "人にやさしい" }
  ]

  include ActiveHash::Associations
  has_many :products
  
end