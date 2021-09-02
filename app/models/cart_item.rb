class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  validates :quantity, presence: true, numericality: { other_than: 0, message: "を選択してください" }
end
