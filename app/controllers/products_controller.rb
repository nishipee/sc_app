class ProductsController < ApplicationController
  before_action :authenticate_corporate_user!, except: [:index, :show, :recent_products, :popular_products]
  before_action :set_product, except: [:index, :new, :create, :recent_products, :popular_products]
  before_action :move_to_session, except: [:index, :new, :create, :show, :recent_products, :popular_products]

  def index
    @product1 = Product.includes(:corporate_user).order("created_at DESC").first(3)
    @product2 = Product.includes(:corporate_user).order("sold_num DESC").first(3)
    @donation_history = DonationHistory.includes(:sc_group).order("created_at DESC").first(3)
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
  end

  def update
    if @product.update(product_params)
      redirect_to corporate_user_path(current_corporate_user.id)
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @product.destroy
    redirect_to corporate_user_path(current_corporate_user.id)
  end

  def recent_products
    @product1 = Product.includes(:corporate_user).order("created_at DESC").first(50)
  end

  def popular_products
    @product2 = Product.includes(:corporate_user).order("sold_num DESC").first(50)
  end

  
  private
  def product_params
    params.require(:product).permit(:name, :introduction, :category1_id, :category2_id, :category3_id, :charge_id, :prefecture_id, :scheduled_day_id, :price, :image).merge(corporate_user_id: current_corporate_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def move_to_session
    if current_corporate_user != @product.corporate_user
      redirect_to new_corporate_user_session_path
    end
  end

end