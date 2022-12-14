FactoryBot.define do
  factory :user do
   nickname {Faker::Name.last_name}
   email {Faker::Internet.free_email}
   password {"aaaaa1"}
   password_confirmation {password}
   family_name { "山田" }
   first_name { "太郎" }
   family_name_kana { "ヤマダ" }
   first_name_kana { "タロウ" }
   birthday { "2000-01-01" }
  end
end
