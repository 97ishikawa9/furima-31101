class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :send_price
  belongs_to :prefectures
  belongs_to :sending_days
  belongs_to :status
  belongs_to :user
  has_one_attached :image
  belongs_to :purchase

  with_options presence: true do
    validates :name
    validates :image
    validates :description
    validates :category_id
    validates :send_price_id
    validates :prefectures_id
    validates :sending_days_id
    validates :price, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters.' }
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :send_price_id
    validates :prefectures_id
    validates :sending_days_id
  end
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }
end
