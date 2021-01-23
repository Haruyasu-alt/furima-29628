FactoryBot.define do
  factory :item do
    name {"商品名"}
    explanation {"説明"}
    category_id {2}
    state_id {2}
    delivery_fee_id {2}
    shipment_source_id {2}
    days_to_ship_id {2}
    price {1000}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/star.png'), filename: 'test_image.png')
    end
  end
end