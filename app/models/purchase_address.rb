class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :post_num, :prefectures_id, :city, :address_num, :building_name, :phone_num, :token

  with_options presence: true do
    validates :post_num, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :address_num
    validates :phone_num
    validates :token
  end

  validates :prefectures_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    user = User.create(nickname: nickname, email: email, family_name: family_name, first_name: first_name, family_name_kana: family_name_kana, first_name_kana: first_name_kana, birthday: birthday )
    item = Item.create(name: name, description: description, category_id: category_id, status_id: status_id, send_price_id: send_price_id, prefectures_id: prefectures_id, price: price, user_id: user.id)
    Purchase.create(user_id: user.id, item_id: item.id)
    Address.create(post_num: post_num, prefectures_id: prefectures_id, city: city, address_num: address_num, building_name: building_name, phone_num: phone_num, purchase_id: purchase.id)
  end
end