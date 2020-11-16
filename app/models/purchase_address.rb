class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :post_num, :prefectures_id, :city, :address_num, :building_name, :phone_num, :token, :user_id, :item_id, :purchase_id

  with_options presence: true do
    validates :post_num, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :address_num
    validates :phone_num, format: {with: /\A\d{11}\z/, message: "is invalid. Input half-width number"}
    validates :token
  end

  validates :prefectures_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(post_num: post_num, prefectures_id: prefectures_id, city: city, address_num: address_num, building_name: building_name, phone_num: phone_num, purchase_id: purchase.id)
  end
end