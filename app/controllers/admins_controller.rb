class AdminsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @products = Product.includes(:corporate_user)
    @sales = @products.inject(0) { |sum, item| sum + item.sum_of_sales }

    @corporate_users = CorporateUser.all
    @sc_groups = ScGroup.all
  end

  def show_c_user
    @corporate_user = CorporateUser.find(params[:corporate_user_id])
  end

  def show_sc_group
    @sc_group = ScGroup.find(params[:sc_group_id])
  end
end