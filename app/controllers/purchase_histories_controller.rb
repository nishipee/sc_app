class PurchaseHistoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_top
  
  def index
    @cart_items = current_cart.cart_items.includes([:product])
    @sub_total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_sub_price }
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price } + @sub_total
    @purchase_history_address = PurchaseHistoryAddress.new
  end

  def create
    @cart_items = current_cart.cart_items.includes([:product])
    @purchase_history_address = PurchaseHistoryAddress.new(purchase_history_address_params)
    if @purchase_history_address.valid?
      pay_item
      @purchase_history_address.all_save

      # 商品購入個数のカウント
      count_sold

      current_cart.destroy

      redirect_to order_completed_path
    else
      redirect_to purchase_histories_path, flash: { alert: @purchase_history_address.errors.full_messages }
    end
  end

  def order_completed
  end

  private
  def purchase_history_address_params
    params.require(:purchase_history_address).permit(:postcode, :prefecture_id, :city, :house_number, :building_name, :phone_num, :total_price, :total_charge, :product_id, :quantity).merge(user_id: current_user.id, token: params[:token])
  end

  def move_to_top
    unless current_cart.cart_items.present?
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: purchase_history_address_params[:total_price],
      card: purchase_history_address_params[:token],
      currency: "jpy"
    )
  end

  def count_sold
    @cart_items.each do |cart_item|
      cart_item.product.sold_num += cart_item.quantity
      cart_item.product.save
    end
  end
end
