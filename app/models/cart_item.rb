class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  validates :quantity, presence: true, numericality: { other_than: 0, message: "を選択してください" }

  def sum_of_price
    product.price * quantity
  end
end
