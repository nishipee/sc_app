class ScGroupsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @sc_group = ScGroup.new
  end

  def create
    @sc_group = ScGroup.new(sc_group_params)
    if @sc_group.save
      redirect_to admins_path
    else
      render :new
    end
  end

  private
  def sc_group_params
    params.require(:sc_group).permit(:name, :introduction, :how_donation).merge(admin_id: current_admin.id)
  end
end
