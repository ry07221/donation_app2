require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'すべての情報があれば登録できる' do
      expect(@user).to be_valid
    end
    it 'nameが空だと保存できないこと' do
      @user.name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end
    it 'nameが全角日本語でないと保存できないこと' do
      @user.name = 'suzuki'
      @user.valid?
      expect(@user.errors.full_messages).to include("Name is invalid. Input full-width characters.")
    end
    it 'name_readingが空だと保存できないこと' do
      @user.name_reading = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Name reading can't be blank")
    end
    it 'name_readingが全角カタカナでないと保存できないこと' do
      @user.name_reading = 'すずき'
      @user.valid?
      expect(@user.errors.full_messages).to include("Name reading is invalid. Input full-width katakana characters.")
    end
    it 'nicknameが空だと保存できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'nicknameが半角でないと保存できないこと' do
      @user.nickname = '鈴木'
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname is invalid. Input half-width characters.")
    end
  end
end
