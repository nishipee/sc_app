class ProductsController < ApplicationController
  def index
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
  end

  
  private
  def product_params
    params.require(:product).permit(:name, :introduction, :category_id, :charge_id, :prefecture_id, :scheduled_day_id, :price).merge(corporate_user_id: current_corporate_user.id)
  end
end
