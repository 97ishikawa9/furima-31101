class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :post_num ,null: false
      t.integer :prefectures_id, null: false
      t.string :city, null: false
      t.string :address_num, null: false
      t.string :building_name
      t.integer :phone_num, null: false
      t.references :purchase, null: false,  foreign_key: true
      t.timestamps
    end
  end
end
