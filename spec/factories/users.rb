FactoryBot.define do
  
  factory :user do
    email                 {"aaa@gmail.com"}
    password              {"aaaa0000"}
    password_confirmation {"aaaa0000"}
    nickname              {"test_user"}
    familyname            {"sei"}
    firstname             {"mei"}
    familyname_kana       {"セイ"}
    firstname_kana        {"メイ"}
    birthday              {"1993-09-22"}
  end
end