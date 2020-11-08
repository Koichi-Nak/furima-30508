FactoryBot.define do
  factory :item do
    item_name { Faker::Name.name(max_length: 40) }
    description { Faker::Text.characters(max_length: 1000) }
    category_id { Faker::Number.between(from: 1, to: 11) }
    item_status_id { Faker::Number.between(from: 1, to: 7) }
    delivery_charge_id { Faker::Number.between(from: 1, to: 3) }
    shipping_from_id { Faker::Number.between(from: 1, to: 48) }
    shipping_preparation_id { Faker::Number.between(from: 1, to: 4) }
    price { Faker::Number.between(from: 300, to: 9999999) }

    after(:build) do |pic|
      pic.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
