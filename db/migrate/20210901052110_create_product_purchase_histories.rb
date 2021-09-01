class CreateProductPurchaseHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :product_purchase_histories do |t|
      t.references :product,          foreign_key: true
      t.references :purchase_history, foreign_key: true

      t.timestamps
    end
  end
end
