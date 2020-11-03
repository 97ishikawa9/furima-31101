class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.string :category_id
      t.string :status_id
      t.string :send_price_id
      t.string :prefectures_id
      t.string :sending_days_id
      t.string :price
      t.references :user
      t.timestamps
    end
  end
end
