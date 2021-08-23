class CreateCartItems < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_items do |t|
      t.integer :products_num
      t.references :user,       foreign_key: true
      t.references :product,    foreign_key: true

      t.timestamps
    end
  end
end
