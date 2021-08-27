class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  validates :quantity, presence: true, numericality: { other_than: 0, message: "を選択してください" }

  def sum_of_price
    product.price * quantity
  end

  def sum_of_sub_price
    if product.charge.id == 2
      0
    elsif product.charge.id == 3
      500 * quantity
    end
  end
end
