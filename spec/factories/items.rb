FactoryBot.define do
  factory :item do
    item_name { Faker::Lorem.word }
    description { Faker::Lorem.paragraphs }
    category_id { Faker::Number.between(from: 2, to: 11) }
    rating_id { Faker::Number.between(from: 2, to: 6) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpeg'), filename: 'test_image.jpeg')
    end
  end
end
