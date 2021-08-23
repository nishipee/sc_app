class AddSoldNumToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :sold_num, :integer, default: 0
  end
end
