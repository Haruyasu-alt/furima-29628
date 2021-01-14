FactoryBot.define do
  factory :user do
    nickname {"内場"}
    last_name {"内場"}
    first_name {"晴康"}
    last_name_kana {"ウチバ"}
    first_name_kana {"ハルヤス"}
    email {Faker::Internet.free_email}
    password {"123abc"}
    password_confirmation {password}
    birthday {"1969-02-06"}
  end
end