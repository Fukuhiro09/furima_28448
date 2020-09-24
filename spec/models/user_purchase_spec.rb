require 'rails_helper'
RSpec.describe UserPurchase, type: :model do

  describe 'Purchase' do
    before do
      
      @user_purchase = FactoryBot.build(:user_purchase)
    end

    context '購入がうまくいくとき' do
      it "card_tokenとpostal_codeとcityとhouse_numberとphone_numberとprefecture_idが存在すれば登録できる"
      expect(@user_purchase).to be_valid
    end

    context '購入がうまくいかないとき' do
      it "card_tokenが空だと登録できない"
        @user_purchase.card_token = ""  
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Card token can't be blank ")
      end
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
      it "postal_codeにハイフンがないと登録できない"
        @user_purchase.postal_code = "1234444"  
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Postal code 空では登録できません")
      end
      it "phone_numberがハイフンなしの11桁以内出ないと登録できません" do
        @user_purchase.phone_number = "090-1234-5678"
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Phone numberハイフンなしの11桁以内出ないと登録できません")
      end
    end
  end
end