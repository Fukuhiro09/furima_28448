require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: @user.id)
    @item.image = fixture_file_upload('public/images/dog.jpg')

  end
   

  describe '商品の情報' do
    context 'name' do
      it 'product_nameが空だと登録できない' do
        @item.product_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
    end

    it 'imageが空だと登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'infoが空だと登録できない' do
      @item.info = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Info can't be blank")
    end

    it 'category_idが空だと登録できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Category is not a number')
    end

    it 'sales_status_idが空だと登録できない' do
      @item.sales_status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Sales status is not a number')
    end

    it 'shipping_fee_idが空だと登録できない' do
      @item.shipping_fee_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping fee is not a number')
    end

    it 'prefecture_idが空だと登録できない' do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture is not a number')
    end

    it 'scheduled_delivery_idが空だと登録できない' do
      @item.scheduled_delivery_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Scheduled delivery is not a number')
    end

    it 'priceが¥300未満だと登録できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range')
    end

    it 'priceが全角数字だと登録できない' do
      @item.price = '８８８'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range')
    end

    it 'Price must be less than 9999999' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range')
    end
  end
 end
