class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :status, :shipping_fee_status, :prefecture, :lead_time

  belongs_to :user
  # has_one :transaction
  has_one_attached :image
  with_options presence: true do
    validates :price, numericality: { greater_than: 299, less_than: 10_000_000 },
                      format: { with: /\d/, message: 'is invalid. Input half-width numbers.' }
    validates :user, :product_name, :introduction, :image
    validates :category_id, :status_id, :shipping_fee_status_id, :prefecture_id, :lead_time_id, numericality: { other_than: 1 }
  end
end
