FactoryBot.define do
  factory :item do
    product_name           { Faker::Commerce.product_name }
    introduction           { Faker::Lorem.sentence }
    category_id            { 2 }
    status_id              { 2 }
    shipping_fee_status_id { 2 }
    prefecture_id          { 2 }
    lead_time_id           { 2 }
    price                  { 1000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
