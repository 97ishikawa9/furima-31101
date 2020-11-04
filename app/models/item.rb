class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :send_price
  belongs_to :pref
  belongs_to :sending_day
  belongs_to :status
  belongs_to :user
  has_one_attached :image

  validates :name,:description,:category,:send_price,:prefectures,:sending_days,:price, presence: true
  validates :category_id,:status_id,:send_price_id,:prefectures_id,:sending_days_id, numericality: { other_than: 1 }
end
