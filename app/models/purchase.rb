class Purchase < ApplicationRecord
  belongs_to :item
  has_one :address
  has_many :users
end

