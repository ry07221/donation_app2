require 'rails_helper'

RSpec.describe DonationAddress, type: :model do
  describe '寄付情報の保存' do
    before do
      user = FactoryBot.build(:user)
      @donation_address = FactoryBot.build(:donation_address, user_id: user.id)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@donation_address).to be_valid
    end
    it 'postal_codeが空だと保存できないこと' do
      @donation_address.postal_code = nil
      @donation_address.valid?
      expect(@donation_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @donation_address.postal_code = '1234567'
      @donation_address.valid?
      expect(@donation_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it 'prefectureを選択していないと保存できないこと' do
      @donation_address.prefecture = 0
      @donation_address.valid?
      expect(@donation_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'cityは空でも保存できること' do
      @donation_address.city = nil
      expect(@donation_address).to be_valid
    end
    it 'house_numberは空でも保存できること' do
      @donation_address.house_number = nil
      expect(@donation_address).to be_valid
    end
    it 'building_nameは空でも保存できること' do
      @donation_address.building_name = nil
      expect(@donation_address).to be_valid
    end
    it 'priceが空だと保存できないこと' do
      @donation_address.price = nil
      @donation_address.valid?
      expect(@donation_address.errors.full_messages).to include("Price can't be blank")
    end
    it 'priceが全角数字だと保存できないこと' do
      @donation_address.price = '２０００'
      @donation_address.valid?
      expect(@donation_address.errors.full_messages).to include("Price is invalid")
    end
    it 'priceが1円未満では保存できないこと' do
      @donation_address.price = 0
      @donation_address.valid?
      expect(@donation_address.errors.full_messages).to include("Price is invalid")
    end
    it 'priceが1,000,000円を超過すると保存できないこと' do
      @donation_address.price = 1000001
      @donation_address.valid?
      expect(@donation_address.errors.full_messages).to include("Price is invalid")
    end
  end
end
