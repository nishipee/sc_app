class ScGroupsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_sc_group, only: [:edit, :update, :destroy]

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

  def edit
  end

  def update
    if @sc_group.update(sc_group_params)
      redirect_to admins_path
    else
      render :edit
    end
  end

  def destroy
    @sc_group.destroy
    redirect_to admins_path
  end

  private
  def sc_group_params
    params.require(:sc_group).permit(:image, :name, :introduction, :how_donation).merge(admin_id: current_admin.id)
  end

  def set_sc_group
    @sc_group = ScGroup.find(params[:id])
  end
end