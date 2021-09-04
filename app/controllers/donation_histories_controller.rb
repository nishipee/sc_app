class DonationHistoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @sc_groups = ScGroup.includes(:admin).order("created_at DESC")
    @donation_history = DonationHistory.new
    @user = User.find(current_user.id)
  end

  def create
    @sc_group = ScGroup.find(params[:sc_group_id])
    @donation_history = DonationHistory.new(donation_history_params)
    if @donation_history.save
      redirect_to donation_completed_path
    else
      redirect_to donation_histories_path, flash: { alert: @donation_history.errors.full_messages }
    end
  end

  def donation_completed
  end


  private

  def donation_history_params
    params.require(:donation_history).permit(:points).merge(user_id: current_user.id, sc_group_id: params[:sc_group_id])
  end
end
