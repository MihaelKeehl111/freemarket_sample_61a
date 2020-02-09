FactoryBot.define do
  factory :card do
    card_number               {"1111222211112222"}
    expiration_month          {"09"}
    expiration_year           {"22"}
    security_code             {"765"}
  end
end
