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
| last_name         | string | null: false |
| first_name        | string | null: false |
| last_name_kana    | string | null: false |
| first_name_kana   | string | null: false |
| birth_date        | date   | null: false |

### Association

- has_many :items
- has_many :comments
- has_one :customer


## items テーブル

| column               | Type      | Options                        |
|----------------------|-----------|--------------------------------|
| name                 | string    | null: false                    |
| description          | text      | null: false                    |
| genre_id             | integer   | null: false                    |
| condition_id         | integer   | null: false                    |
| shipping_fee_info_id | integer   | null: false                    |
| location_id          | integer   | null: false                    |
| days_to_ship_id      | integer   | null: false                    |
| price                | string    | null: false                    |
| user                 | reference | null: false, foreign_key: true |

### Association

- has_many :comments
- belongs_to :user
- has_one :customer

## customers テーブル

| column            | Type      | Options                        |
|-------------------|-----------|--------------------------------|
| user              | reference | null: false, foreign_key: true |
| item              | reference | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## addresses テーブル

| column            | Type      | Options                        |
|-------------------|-----------|--------------------------------|
| postal_code       | string    | null: false                    |
| prefecture_id     | integer   | null: false                    |
| city              | string    | null: false                    |
| street            | string    | null: false                    |
| building          | string    | null: true                     |
| tel               | integer   | null: false                    |
| item              | reference | null: false, foreign_key: true |
| user              | reference | null: false, foreign_key: true |
| customers         | reference | null: false, foreign_key: true |

### Association

- belongs_to: customer

## comments テーブル
| column            | Type      | Options                        |
|-------------------|-----------|--------------------------------|
| content           | text      | null: false                    |
| item              | reference | null: false, foreign_key: true |
| user              | reference | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

