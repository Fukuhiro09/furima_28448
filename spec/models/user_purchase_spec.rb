require 'rails_helper'
RSpec.describe UserPurchase, type: :model do

  describe 'Purchase' do
    before do
      
      @user_purchase = FactoryBot.build(:user_purchase)
    end

    context '購入がうまくいくとき' do
      it "postal_codeとcityとhouse_numberとphone_numberとprefecture_idが存在すれば登録できる"
      expect(@user_purchase).to be_valid
    end

    context '購入がうまくいかないとき' do
      it "postal_codeが空だと登録できない" do
        @user_purchase.postal_code = ""  
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Postal code 空では登録できません")
      end
      it "cityが空だと登録できない" do
        @user_purchase.city = ""  
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("City can't be blank")
      end
      it "house_numberが空だと登録できない" do
        @user_purchase.house_number = ""  
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("House number can't be blank")
      end
      it "phone_numberが空だと登録できない" do
        @user_purchase.phone_number = ""  
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Phone number can't be blank")
      end
      it "prefecture_idが空だと登録できない" do
        @user_purchase.prefecture_id = ""  
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Prefecture can't be blank")
      end
    end
  end
end