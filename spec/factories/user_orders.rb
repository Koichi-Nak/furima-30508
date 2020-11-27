FactoryBot.define do
  factory :user_order do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '111-2222' }
    add_pref_id { 2 }
    add_muni { '大阪市中央区' }
    add_local { '難波1-1-1' }
    add_house { 'なんばビル100F' }
    phone_num { '09011111111' }
  end
end
