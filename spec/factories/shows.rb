FactoryBot.define do
  factory :show do
    date { "2020-02-04" }
    ppv { false }
    attendance { 1 }
    venue_id { 1 }
    promotion_id { 1 }
    name { "MyString" }
  end
end
