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

| Column      | Type   | Options                   |
| --------    | ------ | -----------               |
| nickname    | string | null: false               |
| mailaddress | string | null: false, unique: true |
| password    | string | null: false               |

### Association

- has_many :items
- has_many :buy_record

## items テーブル

| Column           | Type       | Options           |
| ------           | ------     | -----------       |
| image            | string     | null: false       |
| item_name        | string     | null: false       |
| item_explanation | string     | null: false       |
| category         | string     | null: false       |
| item_state       | string     | null: false       |
| delivery_fee     | string     | null: false       |
| shipment_source  | string     | null: false       |
| days_to_ship     | string     | null: false       |
| price            | string     | null: false       |
| seller           | string     | null: false       |
| user_id          | references | foreign_key: true |

### Association

- belongs_to :users
- has_one :buy_record

## buy_record テーブル

| Column  | Type       | Options                        |
| ------  | ---------- | ------------------------------ |
| buyer   | string     | null: false                    |
| user_id | references | foreign_key: true              |

### Association

- belongs_to :users
- belongs_to :items
- has_one :address

## address テーブル

| Column       | Type   | Options     |
| -------      | ------ | ----------- |
| postal_code  | string | null: false |
| prefectures  | string | null: false |
| municpality  | string | null: false |
| house_number | string | null: false |
| phone_number | string | null: false |

### Association

- belongs_to :buy_record