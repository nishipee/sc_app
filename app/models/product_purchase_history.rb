class ProductPurchaseHistory < ApplicationRecord
  belongs_to :product
  belongs_to :purchase_history
  belongs_to :user
end
