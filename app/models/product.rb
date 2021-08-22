class Product < ApplicationRecord]
  belongs_to :corporate_user
  has_one_attached :image
end
