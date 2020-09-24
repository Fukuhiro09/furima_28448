FactoryBot.define do
  factory :user_purchase do
    postal_code           { '123-4567' }
    city                  { '横浜' }
    house_number          { '青山１ー１ー1' }
    phone_number          { '09012345678' }
    prefecture_id         {1}
    card_token            { 'hoge_00000' }
  end
end
