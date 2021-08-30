class PurchaseHistoriesController < ApplicationController
  def index
    @cart_items = current_cart.cart_items.includes([:product])
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
    @sub_total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_sub_price }
  end
end
