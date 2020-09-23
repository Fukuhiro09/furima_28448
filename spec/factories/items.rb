FactoryBot.define do
  factory :seller_item, class: Item do
    sequence(:product_name) { |i| "product_#{i}"}
    sequence(:info) { |i| "info_#{i}"}

    
    category_id           { 'メンズ' }
    sales_status_id       { '未使用に近い' }
    shipping_fee_id       { '着払い' }
    prefecture_id         { '北海道' }
    scheduled_delivery_id { '1〜2日で発送' }
    price                 { 400 }
      #出品者のaddressと連携します。
      association :user_address, factory: :seller_address
      #出品者のaddress内にあるuserと連携します。
      user             {user_address.user}
  end
end
