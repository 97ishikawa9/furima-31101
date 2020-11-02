FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    family_name {"井上"}
    first_name {"小百合"}
    family_name_kana {"イノウエ"}
    first_name_kana {"サユリ"}
    birthday {"1994-12-14"}
  end
end