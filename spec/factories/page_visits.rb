FactoryBot.define do
  factory :page_visit do
    web_page_id { 1 }
    visited_at { "2020-02-02 16:29:15" }
    file_path { "MyString" }
  end
end
