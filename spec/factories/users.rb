FactoryBot.define do
  factory :user do
    nickname = Faker::Name.initials(number: 2)
    nickname {nickname}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    last_name_kan {Gimei.last.kanji}
    first_name_kan {Gimei.first.kanji}
    last_name_kana {Gimei.last.katakana}
    first_name_kana {Gimei.first.katakana}
    birth_date {Faker::Date.between(from: '1930-01-01', to: '2015-12-31')}
  end
end