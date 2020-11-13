FactoryBot.define do
  factory :purchase_address do
    post_num { "100-3423" }
    prefectures_id { 6 }
    city { "金森市" }
    address_num { "市岡2-3" }
    building_name { "市岡ハイツ" }
    phone_num { "080-4323-3455" }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
