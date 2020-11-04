class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :send_price
  belongs_to :pref
  belongs_to :sending_day
  belongs_to :status
  belongs_to :user
  has_one_attached :image

  validates :name, :image, :description, :category_id, :send_price_id, :prefectures_id, :sending_days_id, presence: true
  validates :category_id, :status_id, :send_price_id, :prefectures_id, :sending_days_id, numericality: { other_than: 1 }
  with_options presence: true do
    validates :price, format: {with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters."}
  end
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
end
