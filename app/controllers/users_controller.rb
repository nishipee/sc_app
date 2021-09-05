class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :move_to_index

  def show
    @product_purchase_history = ProductPurchaseHistory.includes(:purchase_history).where(user_id: current_user.id).order("created_at DESC").first(3)
    @donation_history = DonationHistory.includes(:sc_group).where(user_id: current_user.id).order("created_at DESC").first(3)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end


  def order_products
    @product_purchase_history = ProductPurchaseHistory.includes(:purchase_history).where(user_id: current_user.id).order("created_at DESC")
  end

  def donation
    @donation_history = DonationHistory.includes(:sc_group).where(user_id: current_user.id).order("created_at DESC")
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :postcode, :prefecture_id, :city, :house_number, :building_name, :phone_num, :birthday)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def move_to_index
    if current_user.id != @user.id
      redirect_to root_path
    end
  end
end