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

| column            | Type   | Options     |
|-------------------|--------|-------------|
| nickname          | string | null: false |
| email             | string | null: false |
| password          | string | null: false |
| name              | string | null: false |
| name_kana         | string | null: false |
| birth_date        | string | null: false |

### Association

- has_many :items
- has_many :comments
- has_one :customer


## items テーブル

| column            | Type      | Options                        |
|-------------------|-----------|--------------------------------|
| image             | string    | null: false                    |
| name              | string    | null: false                    |
| description       | string    | null: false                    |
| genre             | string    | null: false                    |
| condition         | string    | null: false                    |
| shipping_fee_info | string    | null: false                    |
| location          | string    | null: false                    |
| price             | string    | null: false                    |
| user_id           | reference | null: false, foreign_key: true |

### Association

- has_many :comments
- belongs_to :user
- belongs_to :customer

## customers テーブル

| column            | Type      | Options                        |
|-------------------|-----------|--------------------------------|
| cc_number         | string    | null: false                    |
| expire_date       | string    | null: false                    |
| cvc               | string    | null: false                    |
| postal_code       | string    | null: false                    |
| address           | string    | null: false                    |
| tel               | string    | null: false                    |
| item_id           | reference | null: false, foreign_key: true |
| user_id           | reference | null: false, foreign_key: true |

### Association

- has_many :items
- belongs_to :user

## comments テーブル
| column            | Type      | Options                        |
|-------------------|-----------|--------------------------------|
| cc_number         | string    | null: false                    |
| item_id           | reference | null: false, foreign_key: true |
| user_id           | reference | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item