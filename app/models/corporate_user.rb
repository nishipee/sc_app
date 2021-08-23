class CorporateUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :products
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  with_options presence: true do
    validates :name
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "はハイフンを含む半角数字で入力してください" }
    validates :prefecture_id, numericality: { other_than: 1, message: "を選択してください" }
    validates :city
    validates :house_number
    validates :building_name
    validates :phone_num, length: { maximum: 11 }, format: { with: /\A[0-9]+\z/, message: "は半角数字で入力してください" }
  end

  validates :email, uniqueness: { case_sensitive: false }
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d][a-zA-Z0-9]+\z/, message: "は半角英数字で入力してください" }
end
