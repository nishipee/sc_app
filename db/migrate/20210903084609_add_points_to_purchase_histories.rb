class AddPointsToPurchaseHistories < ActiveRecord::Migration[6.0]
  def change
    add_column :purchase_histories, :points, :integer
  end
end
