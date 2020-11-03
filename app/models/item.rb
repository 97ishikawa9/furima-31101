class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :send_price_id, presence: true
  validates :prefectures_id, presence: true
  validates :sending_days_id, presence: true
  validates :price, presence: true
end
