class Product < ApplicationRecord
  belongs_to :corporate_user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :charge
  belongs_to :category1
  belongs_to :category2
  belongs_to :category3
  belongs_to :scheduled_day

  with_options presence: true do
    validates :image
    validates :name
    validates :introduction
  end

  with_options presence: true, numericality: { other_than: 1, message: "を選択してください" } do
    validates :category1_id
    validates :category2_id
    validates :category3_id
    validates :charge_id
    validates :prefecture_id
    validates :scheduled_day_id
  end

  validates :price, numericality: { with: /\A[0-9]+\z/, message: "は半角数字で入力してください" }
end
