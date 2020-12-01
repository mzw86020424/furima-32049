class OrderForm
  include ActiveModel::Model
  attr_accessor :user, :item, :addresses, :building, :phone, :postal_code, :city, :prefecture_id, :order  

    with_options presence: true do
    validates :user, :item, :addresses, :city, :prefecture_id, :order
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'is invalid.' }
    validates :phone, format: { with: /\A\d{10,11}\z/, message: 'is invalid.' }
  end
end