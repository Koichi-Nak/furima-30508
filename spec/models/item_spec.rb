require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品出品がうまくいくとき' do
      it 'imageとitem_name、description、category_id、item_status_id、delivery_charge_id、shipping_from_id、shipping_preparation、price、user_idが存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it 'category_idが2〜11であれば登録出来る' do
        @item.category_id = '2'
        expect(@item).to be_valid
      end
      it 'item_status_idが2〜7であれば登録出来る' do
        @item.item_status_id = '2'
        expect(@item).to be_valid
      end
      it 'delivery_charge__idが2〜3であれば登録出来る' do
        @item.delivery_charge_id = '2'
        expect(@item).to be_valid
      end
      it 'shipping_from_idが2〜48であれば登録出来る' do
        @item.shipping_from_id = '2'
        expect(@item).to be_valid
      end
      it 'shipping_preparation_idが2〜4であれば登録出来る' do
        @item.shipping_preparation_id = '2'
        expect(@item).to be_valid
      end
      it 'priceが半角数字の300〜9999999であれば登録出来る' do
        @item.price = '300'
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_nameが空だと登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'descriptionが空だと登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが`--`(id:1)だと登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end
      it 'item_status_idが`--`(id:1)だと登録できない' do
        @item.item_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item status Select')
      end
      it 'delivery_charge_idが`--`(id:1)だと登録できない' do
        @item.delivery_charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery charge Select')
      end
      it 'shipping_from_idが`--`(id:1)だと登録できない' do
        @item.shipping_from_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping from Select')
      end
      it 'shipping_preparation_idが`--`(id:1)だと登録できない' do
        @item.shipping_preparation_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping preparation Select')
      end
      it 'priceが空では登録出来ない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが半角数字でない場合は登録出来ない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number')
      end
      it 'priceが300未満の場合は登録出来ない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it 'priceが9999999を超える場合は登録出来ない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
    end
  end
end
