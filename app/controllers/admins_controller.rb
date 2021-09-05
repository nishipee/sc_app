class AdminsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @products = Product.includes(:corporate_user)
    @sales = @products.inject(0) { |sum, item| sum + item.sum_of_sales }

    @corporate_users = CorporateUser.all.order("created_at DESC")
    @sc_groups = ScGroup.all
    donation_price
  end

  def show_c_user
    @corporate_user = CorporateUser.find(params[:corporate_user_id])
  end

  def show_sc_group
    @sc_group = ScGroup.find(params[:sc_group_id])
  end

  private

  def donation_price
    @donation = []
    @sc_groups.each_with_index do |sc_g|
      @donation_histoy = DonationHistory.where(sc_group_id: sc_g.id)
      @donation << @donation_histoy.inject(0) { |sum, item| sum + item.points }
    end
  end
end