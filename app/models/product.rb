class Product < ApplicationRecord]
  belongs_to :corporate_user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :charge
  belongs_to :category
  belongs_to :scheduled_day

  with_options presence: true, numericality: { other_than: 1, message: "を選択してください" } do
    validates :prefecture_id
    validates :category_id
    validates :charge_id
    validates :scheduled_day_id
  end

  with_options presence: true do
    validates :image
    validates :name
    validates :introduction
  end

  validates :price, numericality: { with: /\A[0-9]+\z/, message: "は半角数字で入力してください" }
end
