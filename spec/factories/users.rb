FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    birthday              { Faker::Date.birthday }
    age_id { Faker::Number.between(from: 2, to: 11) }
    face_type_id { Faker::Number.between(from: 2, to: 9) }
    makeup_type_id { Faker::Number.between(from: 2, to: 3) }
    personal_color_id { Faker::Number.between(from: 2, to: 5) }
    skin_color_id { Faker::Number.between(from: 2, to: 4) }
    skin_type_id { Faker::Number.between(from: 2, to: 5) }
  end
end