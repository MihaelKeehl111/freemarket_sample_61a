FactoryBot.define do
  factory :user do
    email                 {"aaa@gmail.com"}
    password              {"aaaa0000"}
    password_confirmation {"aaaa0000"}
    nickname              {"test_user"}
    familyname            {"姓"}
    firstname             {"名"}
    familyname_kana       {"セイ"}
    firstname_kana        {"メイ"}
    birthday              {"1993-09-22"}
    cellphone             {"08011112222"}
    phone                 {"0322221111"}
  end
end