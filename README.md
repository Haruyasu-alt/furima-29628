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
| nickname           | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| year               | string | null: false               |
| month              | string | null: false               |
| day                | string | null: false               |

### Association

- has_many :items
- has_many :buy_records

## items テーブル

| Column             | Type       | Options           |
| ------             | ------     | -----------       |
| name               | string     | null: false       |
| explanation        | text       | null: false       |
| category_id        | integer    | null: false       |
| state_id           | integer    | null: false       |
| delivery_fee_id    | integer    | null: false       |
| shipment_source_id | integer    | null: false       |
| days_to_ship_id    | integer    | null: false       |
| price              | integer    | null: false       |
| user               | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :buy_record

## buy_record テーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| item   | references | foreign_key: true |
| user   | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## address テーブル

| Column             | Type       | Options           |
| -------            | ------     | -----------       |
| postal_code        | string     | null: false       |
| shipment_source_id | integer    | null: false       |
| municpality        | string     | null: false       |
| house_number       | string     | null: false       |
| building           | string     | null: false       |
| phone_number       | string     | null: false       |
| buy_record         | references | foreign_key: true |

### Association

- belongs_to :buy_record