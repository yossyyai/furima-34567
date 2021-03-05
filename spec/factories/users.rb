FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    first_name            { person.first.kanji}
    last_name             { person.last.kanji}
    first_name_kana       { person.first.katakana}
    last_name_kana        {person.last.katakana}
    nickname              {Faker::Name.initials(number: 2)}
    birth_date            {Faker::Date.backward}
    email                 {Faker::Internet.free_email}
    password               {"aaa111"}
    password_confirmation  {"aaa111"}
  end
end