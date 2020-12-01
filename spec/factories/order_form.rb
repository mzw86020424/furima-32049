FactoryBot.define do
  factory :order_form do
    addresses     { 111 }
    phone         { 11111111111 }
    postal_code   { 111-1111 }
    city          { Tokyo }
    prefecture_id { 2 }
    order         { 2 }
    token         { 2 }
    price         { 1000 }
    association :user
    association :item

  end
end
