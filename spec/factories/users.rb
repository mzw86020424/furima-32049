FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"xxx123"}
    password_confirmation {password}
    first_name            {"太郎"}
    first_name_kana       {"タロウ"}
    last_name             {"山田"}
    last_name_kana        {"ヤマダ"}
    birth_date            {"1930/1/1"}
  end
end
