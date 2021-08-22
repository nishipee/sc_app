class ProductsController < ApplicationController
  before_action :move_to_session, except: :index

  def index
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to corporate_user_path(current_corporate_user.id)
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to corporate_user_path(current_corporate_user.id)
    else
      render :edit
    end
  end

  
  private
  def product_params
    params.require(:product).permit(:name, :introduction, :category1_id, :category2_id, :category3_id, :charge_id, :prefecture_id, :scheduled_day_id, :price, :image).merge(corporate_user_id: current_corporate_user.id)
  end

  def move_to_session
    @product = Product.find(params[:id])
    if current_corporate_user != @product.corporate_user
      redirect_to new_corporate_user_session_path
    end
  end
end
