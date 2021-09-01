class PurchaseHistory < ApplicationRecord
  belongs_to :user
  has_many :product_purchase_histories
  has_many :products, through: :product_purchase_histories
  has_one :address
end
