# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| --------           | ------ | -----------               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association

- has_many :items
- has_many :buy_record

## items テーブル

| Column             | Type       | Options           |
| ------             | ------     | -----------       |
| item_name          | string     | null: false       |
| item_explanation   | text       | null: false       |
| category_id        | integer    | null: false       |
| item_state_id      | integer    | null: false       |
| delivery_fee_id    | integer    | null: false       |
| shipment_source_id | integer    | null: false       |
| days_to_ship_id    | integer    | null: false       |
| price              | integer    | null: false       |
| seller             | string     | null: false       |
| users              | references | foreign_key: true |

### Association

- belongs_to :users
- has_one :buy_record

## buy_record テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| items  | string     | foreign_key: true              |
| users  | references | foreign_key: true              |

### Association

- belongs_to :users
- belongs_to :items
- has_one :address

## address テーブル

| Column             | Type    | Options     |
| -------            | ------  | ----------- |
| postal_code        | string  | null: false |
| shipment_source_id | integer | null: false |
| municpality        | string  | null: false |
| house_number       | string  | null: false |
| phone_number       | string  | null: false |

### Association

- belongs_to :buy_record