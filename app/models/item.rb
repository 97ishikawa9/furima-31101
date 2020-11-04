class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :send_price
  belongs_to :pref
  belongs_to :sending_day
  belongs_to :status
  belongs_to :user
  has_one_attached :image

  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 1 }
  validates :category, presence: true
  validates :status_id, numericality: { other_than: 1 }
  validates :status, presence: true
  validates :send_price_id, numericality: { other_than: 1 }
  validates :send_price, presence: true
  validates :prefectures_id, numericality: { other_than: 1 }
  validates :prefectures, presence: true
  validates :sending_days_id, numericality: { other_than: 1 }
  validates :sending_days,　presence: true
  validates :price, presence: true
end
