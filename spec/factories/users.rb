FactoryBot.define do
  factory :user do
    name { '鈴木' }
    name_reading { 'スズキ' }
    nickname { 'suzuki' }
    email { 'test@com' }
    password { '111111' }
  end
end
