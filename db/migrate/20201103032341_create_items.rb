class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :category_id, null: false
      t.integer :status_id, null: false
      t.integer :send_price_id, null: false
      t.integer :prefectures_id, null: false
      t.integer :sending_days_id, null: false
      t.integer :price, null: false
      t.references :user
      t.timestamps
    end
  end
end
