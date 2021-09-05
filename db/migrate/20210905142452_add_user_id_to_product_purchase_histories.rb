class AddUserIdToProductPurchaseHistories < ActiveRecord::Migration[6.0]
  def change
    add_reference :product_purchase_histories, :user, null: false, foreign_key: true
  end
end
