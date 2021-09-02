class AdminsController < ApplicationController
  before_action :authenticate_admins!

  def index
    @products = Product.includes(:corporate_user)
    @sales = @products.inject(0) { |sum, item| sum + item.sum_of_sales }

    @corporate_user = CorporateUser.all
  end

  def show_c_user
    @corporate_user = CorporateUser.find(params[:corporate_user_id])
  end
end
