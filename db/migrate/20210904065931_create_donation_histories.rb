class CreateDonationHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :donation_histories do |t|
      t.integer :points
      t.references :user,      foreign_key: true
      t.references :sc_group,  foreign_key: true

      t.timestamps
    end
  end
end
