class CorporateUsersController < ApplicationController
  before_action :authenticate_corporate_user!
  before_action :set_corporate_user
  before_action :move_to_session


  def show
    @product = Product.includes(:corporate_user).where(corporate_user_id: @corporate_user.id).order("created_at DESC")
  end

  def showinfo
  end

  def edit
  end

  def update
    if @corporate_user.update(corporate_user_params)
      redirect_to corporate_user_path(current_corporate_user.id)
    else
      render :edit
    end
  end


  private
  def corporate_user_params
    params.require(:corporate_user).permit(:name, :postcode, :prefecture_id, :city, :house_number, :building_name, :phone_num, :email, :password, :password_confirmation)
  end

  def set_corporate_user
    @corporate_user = CorporateUser.find(params[:id])
  end

  def move_to_session
    if current_corporate_user != @corporate_user
      redirect_to new_corporate_user_session_path
    end
  end
end