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

users　テーブル

| Column         | Type   | Options     |
| ---------------| ------ | ----------- |
| name           | string | null: false |
| email          | string | null: false |
| password       | string | null: false |
| first_name     | string | null: false |
| last_name      | string | null: false |
| kana_first_name| string | null: false |
| kana_last_name | string | null: false |
| birthday       | date   | null: false |

### Association

- has＿many：items
- has＿many：purchase
- has＿many：user_address

items　テーブル

| Column             | Type       | Options                        |
| -----------------  | -- --------| ------------------------------ |
| text               | string     | null: false                    |
| price              | integer    | null: false                    |
| category           | string     | null: false                    |
| phone_number       | integer    | null: false                    |
| user_id            | integer    | null: false, foreign_key: true |
| item_name          | string     | null: false                    |
| information        | string     | null: false                    |
| shipping_fee       | string     | null: false                    |
| sales_status       | string     | null: false                    |
| scheduled delivery | string     | null: false                    |
| prefecture         | string     | null: false                    |

### Association

- has＿one：purchase
- belongs_to : user

purchase　テーブル

| Column       |  Type       | Options                        |
| -----------  | ----------- | ------------------------------ |
| user_id      | integer     | null: false, foreign_key: true |
| item_id      | integer     | null: false, foreign_key: true |

### Association

- has_one :user_address
- belongs_to : user
- belongs_to :item

user_address　テーブル

| Column        | Type        | Options                        |
| ------------- | ----------  | ------------------------------ |
| postal_code   | string      | null: false                    |
| city          | string      | null: false                    |
| house_number  | integer     | null: false                    |
| building_name | string      | null: false                    |
| user_id       | integer     | null: false, foreign_key: true |
| item_id       | integer     | null: false, foreign_key: true |
| purchase_id   | integer     | null: false, foreign_key: true |

### Association
- belongs_to : user
- belongs_to :purchase
