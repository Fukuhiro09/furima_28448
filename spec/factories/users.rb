FactoryBot.define do
  # 出品者用データ factory名は「seller」とします
  factory :seller, class: User do
    sequence(:nickname)        { |i| "出品者_#{i}"}
    sequence(:email)           { |i| "seller_#{i}@test.com"}
    
    password              { '00000000' }
    password_confirmation { password }
    birthday              { Date.today }
    first_name            { '鈴木' }
    last_name             { '隆' }
    kana_first_name       { 'スズキ' }
    kana_last_name        { 'タカシ' }
  end

 # 購入者用データ factory名は「buyer」とします。
  factory :buyer, class: User do
    sequence(:nickname)        { |i| "出品者_#{i}"}
    sequence(:email)           { |i| "seller_#{i}@test.com"}
    
    password              { '00000000' }
    password_confirmation { password }
    birthday              { Date.today }
    first_name            { '鈴木' }
    last_name             { '隆' }
    kana_first_name       { 'スズキ' }
    kana_last_name        { 'タカシ' }
  end
end
