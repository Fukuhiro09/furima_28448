FactoryBot.define do
  # 出品者用データ factory名は「seller」とします
  factory :user do
    
    nickname              { '出品者' }
    email                 { 'test@test.com' }
    password              { '00000000' }
    password_confirmation { password }
    birthday              { Date.today }
    first_name            { '鈴木' }
    last_name             { '隆' }
    kana_first_name       { 'スズキ' }
    kana_last_name        { 'タカシ' }
  end
end
