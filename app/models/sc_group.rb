class ScGroup < ApplicationRecord
  belongs_to :admin
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :introduction
    validates :how_donation
  end
end
