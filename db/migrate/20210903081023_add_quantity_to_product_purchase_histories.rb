class AddQuantityToProductPurchaseHistories < ActiveRecord::Migration[6.0]
  def change
    add_column :product_purchase_histories, :quantity, :integer, default: 0
  end
end
