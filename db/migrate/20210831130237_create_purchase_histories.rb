class CreatePurchaseHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_histories do |t|
      t.integer :total_price,           null: false
      t.integer :total_charge,          null: false
      t.references :user,               foreign_key: true

      t.timestamps
    end
  end
end
