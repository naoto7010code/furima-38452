# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false, unipue: true |
| email              | string | null: false, unipue: true |
| encrypted_password | string | null: false, unipue: true |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user_id         | references | null: false, foreign_key: true |
| item_name       | string     | null: false                    |
| description     | text       | null: false                    |
| category        | integer    | null: false                    |
| condition       | integer    | null: false                    |
| delivery_charge | integer    | null: false                    |
| area            | integer    | null: false                    |
| delivery_days   | integer    | null: false                    |
| price           | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_addresses テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| purchases_id | references | null: false, foreign_key: true |
| post_code    | string     | null: false                    |
| prefecture   | integer    | null: false                    |
| city         | string     | null: false                    |
| address      | string     | null: false                    |
| building     | string     |                                |
| phone_number | string     | null: false                    |

### Association

- belongs_to :purchase
