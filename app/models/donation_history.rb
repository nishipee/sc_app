class DonationHistory < ApplicationRecord
  belongs_to :user
  belongs_to :sc_group

  validates :points, presence: true, numericality: { with: /\A[0-9]+\z/, message: "は半角数字で入力してください" }
end
