require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '新規商品登録' do
    before do
      @item = FactoryBot.build(:item)
    end
    context '商品出品ができる時' do
      it 'image,name,description,category_id,status_id,charges_id,prefectures_id,ship_date_id,priceがあれば投稿できること' do
        expect(@item).to be_valid
      end
    end
    
    context '商品出品ができない時' do
      it 'imageがないと保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameがないと保存できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionがないと保存できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idがないと保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it 'status_idがないと保存できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it 'charges_idがないと保存できない' do
        @item.charges_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Charges must be other than 1")
      end
      it 'prefectures_idがないと保存できない' do
        @item.prefectures_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefectures must be other than 1")
      end
      it 'ship_date_idがないと保存できない' do
        @item.ship_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship date must be other than 1")
      end
      it 'priceがないと保存できない' do
        @item.price = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      
      it '販売価格が300円未満では保存できない' do
        @item.price = 33
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it '販売価格が10000000円以上では保存できない' do
        @item.price = 11111111
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      
      it 'priceが半角数字でないと出品できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it '商品価格が半角英数字混合では出品できない' do
        @item.price = 'aa333'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it '商品価格が半角英字のみでは出品できない' do
        @item.price = 'aaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
    end
  end  
end
