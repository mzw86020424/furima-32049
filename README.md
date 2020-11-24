## users テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| last_name       | string  | null: false |
| first_name      | string  | null: false |
| last_name_kana  | string  | null: false |
| first_name_kana | string  | null: false |
| birth_year      | integer | null: false |
| birth_month     | integer | null: false |
| birth_day       | integer | null: false |

### Association

- has_many :items
- has_many :transactions


## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true |
| product_name        | text       | null: false                    |
| introduction        | text       | null: false                    |
| category            | integer    | null: false                    |
| status              | integer    | null: false                    |
| shipping_fee_status | integer    | null: false                    |
| shipping_prefecture | integer    | null: false                    |
| lead_time           | integer    | null: false                    |
| price               | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :transaction


## transactions テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |
| addresses   | text       | null: false                    |
| building    | text       | null: false                    |
| phone       | integer    | null: false                    |
| postal_code | text       | null: false                    |
| city        | text       | null: false                    |

### Association

- belongs_to :user
- belongs_to :item