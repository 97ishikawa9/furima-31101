require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @purchase_address = FactoryBot.build(:purchase_address)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@purchase_address).to be_valid
    end
    it 'post_numが空だと保存できないこと' do
      @purchase_address.post_num = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Post num can't be blank")
    end
    it 'post_numが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @purchase_address.post_num = '1234567'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Post num is invalid. Include hyphen(-)")
    end
    it 'prefecturesを選択していないと保存できないこと' do
      @purchase_address.prefectures_id = 0
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Prefectures can't be blank")
    end
    it 'cityが空だと保存できないこと' do
      @purchase_address.city = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("City can't be blank")
    end
    it 'address_numが空だと保存できないこと' do
      @purchase_address.address_num = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Address num can't be blank")
    end
    it 'building_nameは空でも保存できること' do
      @purchase_address.building_name = nil
      @purchase_address.valid?
    end
    it 'phone_numが空だと保存できないこと' do
      @purchase_address.phone_num = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone num can't be blank")
    end
  end
end
