## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_kana     | string  | null: false |
| first_name_kana    | string  | null: false |
| birth_date         | date    | null: false |

### Association

- has_many :items
- has_many :transactions


## items テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| user                   | references | null: false, foreign_key: true |
| product_name           | string     | null: false                    |
| introduction           | text       | null: false                    |
| category_id            | integer    | null: false                    |
| status_id              | integer    | null: false                    |
| shipping_fee_status_id | integer    | null: false                    |
| shipping_prefecture_id | integer    | null: false                    |
| lead_time_id           | integer    | null: false                    |
| price                  | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :transaction


## transactions テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping


## shippings テーブル

| Column        | Type       | Options                  |
| ------------- | ---------- | ------------------------ |
| addresses     | string     | null: false              |
| building      | text       |                          |
| phone         | string     | null: false              |
| postal_code   | string     | null: false              |
| city          | string     | null: false              |
| prefecture_id | integer    | null: false              |

### Association

- belongs_to :transaction