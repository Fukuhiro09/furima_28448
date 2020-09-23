class UserPurchase

    include ActiveModel::Model
    attr_accessor :token, :user_id, :product_id, :postal_code, :city, :house_number, :building_name, :delivery_id, :purchase_id, :phone_number, :card_token, :prefecture_id, :item_id

    validates :token,              presence: true
    validates :product_id,         presence: true
    validates :user_id,            presence: true
    validates :city,               presence: true
    validates :house_number,       presence: true
  
    validates :phone_number,       presence: true
    validates :prefecture_id,       presence: true
    validates :postal_code,  format: { with: /\A\d{3}[-]\d{4}\z/, message: "空では登録できません" }
    validates :phone_number, format: { with:  /\A\d{10}$|^\d{11}\z/, message: "ハイフンなしの11桁以内出ないと登録できません"}
   
    def save
      purchase = Purchase.create(user_id: user_id, item_id: item_id)
      UserAddress.create(postal_code: postal_code, city: city, building_name: building_name, purchase_id: purchase_id, phone_number: phone_number, house_number: house_number, prefecture_id: prefecture_id)

    end
  end
  
  
  
  
  
  