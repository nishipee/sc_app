class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name,                              null: false
      t.text :introduction,                        null: false
      t.integer :category1_id,                     null: false
      t.integer :category2_id,                     null: false
      t.integer :category3_id,                     null: false
      t.integer :charge_id,                        null: false
      t.integer :prefecture_id,                    null: false
      t.integer :scheduled_day_id,                 null: false
      t.integer :price,                            null: false
      t.integer :sold_num,                         default: 0
      t.references :corporate_user,                foreign_key: true

      t.timestamps
    end
  end
end
