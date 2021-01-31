FactoryBot.define do
  factory :user do
    nick_name             { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 7) }
    password_confirmation { password }
    first_name            { 'テスト' }
    family_name           { 'テスト' }
    first_name_kana       { 'テスト' }
    family_name_kana      { 'テスト' }
    birth_day             { '1983/10/10' }
  end
end
