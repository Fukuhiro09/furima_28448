FactoryBot.define do
  factory :purchase do
    status_num  {0}

    #出品者のitemと連携します。
    association :item, factory: :seller_item

    #購入者のaddressと連携します。
    association :user_address, factory: :buyer_address
    #購入者のaddress内にあるuserと連携します。
    user        {user_address.user}
  end
end
