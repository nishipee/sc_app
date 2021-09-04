class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :cart, dependent: :destroy
  has_many :purchase_histories
  has_many :donation_histories

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  validates :nickname, presence: true 
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d][a-zA-Z0-9]+\z/, message: "は半角英数字で入力してください" }, on: :registration
  validates :points, numericality: { only_integer: true, greater_than_or_equal_to: 0, message: "が足りません"}, on: :update


  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end
end
