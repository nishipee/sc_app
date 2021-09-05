class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index

  def show
    @product_purchase_history = ProductPurchaseHistory.includes(:purchase_history).where(user_id: current_user.id).order("created_at DESC").first(3)
    @donation_history = DonationHistory.includes(:sc_group).where(user_id: current_user.id).order("created_at DESC").first(3)
  end

  def order_products
    @product_purchase_history = ProductPurchaseHistory.includes(:purchase_history).where(user_id: current_user.id).order("created_at DESC")
  end

  def donation
    @donation_history = DonationHistory.includes(:sc_group).where(user_id: current_user.id).order("created_at DESC")
  end

  def move_to_index
    @user = User.find(params[:id])
    if current_user.id != @user.id
      redirect_to root_path
    end
  end
end