FactoryBot.define do
  factory :item do
    name                            {Faker::Lorem.sentence}
    expostion                       {Faker::Lorem.sentence}
    category_id                     {3}
    price                           {777}
    state_id                        {3}
    burden_id                       {3}
    area_id                         {3}
    days_id                         {3}
    association                     :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
