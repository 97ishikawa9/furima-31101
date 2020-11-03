class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :category_id, null: false
      t.string :status_id, null: false
      t.string :send_price_id, null: false
      t.string :prefectures_id, null: false
      t.string :sending_days_id, null: false
      t.string :price, null: false
      t.references :user
      t.timestamps
    end
  end
end
