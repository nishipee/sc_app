class CorporateUsersController < ApplicationController
  before_action :authenticate_corporate_user!
  before_action :move_to_session

  def show
    @corporate_user = CorporateUser.find(params[:id])
    @product = Product.includes(:corporate_user).where(corporate_user_id: @corporate_user.id).order("created_at DESC")
  end

  private
  def move_to_session
    @corporate_user = CorporateUser.find(params[:id])
    if current_corporate_user != @corporate_user
      redirect_to new_corporate_user_session_path
    end
  end
end
