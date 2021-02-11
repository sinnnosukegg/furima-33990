FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"test123"}
    password_confirmation {password}
    first_name            {"やマ打"}
    last_name             {"たロ雨"}
    first_name_kana       {"ヤマダ"}
    last_name_kana        {"タロウ"}
    birth_day             {"1999-01-02"}
  end
end