FactoryBot.define do
  factory :user do
    nickname              {"abe"}
    email                 {"yamadA-0.1@gmail.com"}
    password              {"00000000"}
    password_confirmation {password}
    birthday              {Date.today}
    first_name            {'鈴木'}
    last_name             {'隆'}
    kana_first_name       { 'スズキ'}
    kana_last_name        { 'タカシ'}
  end
end