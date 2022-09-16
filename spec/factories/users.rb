FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    gender_id             {Faker::Number.between(from: 2, to: 4)}
    prefecture_id         {Faker::Number.between(from: 2, to: 48)}
    introduction          {Faker::Lorem.sentence}
  end
end