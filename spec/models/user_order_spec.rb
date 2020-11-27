require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  before do
    @user_order = FactoryBot.build(:user_order)
  end

  describe '商品の購入' do
    context '商品購入がうまくいくとき' do
      it '全項目を正しく入力すれば購入できる' do
        expect(@user_order).to be_valid
      end
      it '建物名が空であっても購入できる' do
        @user_order.add_house = ''
        expect(@user_order).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'tokenが空だと購入できない' do
        @user_order.token = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号が空だと購入できない' do
        @user_order.postal_code = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号にハイフンがないと購入できない' do
        @user_order.postal_code = '1112222'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it '都道府県が空だと購入できない' do
        @user_order.add_pref_id = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Add pref Select')
      end

      it '都道府県が`--`(id:1)だと購入できない' do
        @user_order.add_pref_id = 1
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Add pref Select')
      end

      it '市区町村が空だと購入できない' do
        @user_order.add_muni = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Add muni can't be blank")
      end

      it '番地が空だと購入できない' do
        @user_order.add_local = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Add local can't be blank")
      end

      it '電話番号が空だと購入できない' do
        @user_order.phone_num = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone num can't be blank")
      end

      it '電話番号にハイフンが含まれていると購入できない' do
        @user_order.phone_num = '090-111-222'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Phone num Input only number')
      end
    end
  end
end
