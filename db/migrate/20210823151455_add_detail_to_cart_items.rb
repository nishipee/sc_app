class AddDetailToCartItems < ActiveRecord::Migration[6.0]
  def change
    add_column :cart_items, :total_price, :integer
    add_column :cart_items, :total_charge, :integer
  end
end
