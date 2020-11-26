class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :status, :shipping_fee_status, :prefecture, :lead_time

  belongs_to :user
  # has_one :transaction

  # 空の投稿を保存できないようにする
  validates :user, :product_name, :introduction, presence: true

  # ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, :status_id, :shipping_fee_status_id, :prefecture_id, :lead_time_id, numericality: { other_than: 1 }
end
