FactoryBot.define do
  factory :purchase do
    token           {"tok_abcdefghijk00000000000000000"}
    postal          {"123-4567"}
    area_id         {Faker::Number.between(from: 2, to: 48)}
    city            {Faker::Address.city}
    addres          {Faker::Address.street_address}
    build           {"ABC Building"}
    call            {Faker::Number.leading_zero_number(digits: 11)}
  end
end
