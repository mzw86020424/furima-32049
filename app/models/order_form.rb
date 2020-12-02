class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :addresses, :building, :phone, :postal_code, :city, :prefecture_id, :order, :token, :price, :user, :item

  with_options presence: true do
    validates :user_id, :item_id, :addresses, :city, :prefecture_id, :token, :price
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'is invalid.' }
    validates :phone, format: { with: /\A\d{10,11}\z/, message: 'is invalid.' }
  end

  def save
    # 注文の情報を保存し、「order」という変数に入れている
    order = Order.create(user_id: user_id, item_id: item_id )
    # 住所の情報を保存
    Shipping.create(addresses: addresses, city: city, prefecture_id: prefecture_id, postal_code: postal_code, building: building, phone: phone, order_id: order.id)
  end

end