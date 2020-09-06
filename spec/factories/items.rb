FactoryBot.define do
  factory :item do
    
    product_name          { 'メガネ' }
    info                  { '赤色' }
    category_id           { 'メンズ' }
    sales_status_id       { '未使用に近い' }
    shipping_fee_id       { '着払い' }
    prefecture_id         { '北海道' }
    scheduled_delivery_id { '1〜2日で発送' }
    price                 { 400 }
  end
end
