FactoryBot.define do
  # 出品者住所
  factory :seller_user_address, class: UserAddress do
    postal_code           { '123-4567' }
    city                  { '横浜' }
    house_number          { '青山１ー１ー1' }
    phone_number          { '09012345678' }
    prefecture_id         {1}
     #出品者のprefecture_idとuserを連携します。
    #  association :prefecture_id, factory: :seller_prefecture_id
     association :user, factory: :seller
 
  end

  # 購入者住所
  factory :buyer_user_address, class: UserAddress do
    postal_code           { '123-4567' }
    city                  { '横浜' }
    house_number          { '青山１ー１ー1' }
    phone_number          { '09012345678' }
    prefecture_id         {1}
  #購入者のprefecture_idとuserを連携します。
  # association :prefecture_id, factory: :buyer_prefecture_id
  association :user, factory: :buyer
  end
end
