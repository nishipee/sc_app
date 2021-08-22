class CorporateUsersController < ApplicationController
  before_action :authenticate_corporate_user!
  before_action :move_to_session, only: :show
  def show
  end

  private
  def move_to_session
    corporate_user = CorporateUser.find(params[:id])
    if current_corporate_user.id != corporate_user.id
      redirect_to new_corporate_user_session_path
    end
  end
end
