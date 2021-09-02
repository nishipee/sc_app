class CreateScGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :sc_groups do |t|
      t.string :name,             null: false
      t.text :introduction,       null: false
      t.text :how_donation,       null: false
      t.references :admin,        foreign_key: true

      t.timestamps
    end
  end
end
