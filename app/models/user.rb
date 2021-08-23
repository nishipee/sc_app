class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  validates :nickname, presence: true 
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d][a-zA-Z0-9]+\z/, message: "は半角英数字で入力してください" } 
end
