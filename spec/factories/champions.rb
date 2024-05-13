FactoryBot.define do
  factory :champion do
    name { "MyString" }
    start_date { "2024-05-06" }
    end_date { "2024-05-06" }
    game_type { "MyString" }
    description { "MyText" }
    rules { "MyText" }
    additional_info { "MyText" }
  end
end
