FactoryBot.define do
  factory :order_form do
    association :user
    association :item

    addresses { '1-1' }
    building { 'a-building' }
    phone { '00000000000' }
    postal_code { '123-4567' }
    city { 'Shinjuku' }
    prefecture_id { 2 }
    token { 'tok_6dafb5a9ba832bda3b60dabb97cd' }
    user_id { 1 }
    item_id { 1 }
    price { 10_000 }
  end
end
