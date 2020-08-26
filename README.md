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

### Association

- has＿many：items
- has＿many：purchase
- has＿many：user_address

items　テーブル

| Column   | Type       | Options                        |
| ---------| ---------- | ------------------------------ |
| text     | string     | null: false                    |
| price    | integer    | null: false                    |
| category | string     | null: false                    |
| user_id  | references | null: false, foreign_key: true |

### Association

- belongs_to : user

purchase　テーブル

| Column       |  Type       | Options                        |
| -----------  | ----------- | ------------------------------ |
| card_number  | integer     | null: false                    |
| phone_number | integer     | null: false                    |
| user_id      | references  | null: false, foreign_key: true |
| item_id      | references  | null: false, foreign_key: true |

### Association

- has_one :user_address
- belongs_to : user

user_address　テーブル

| Column        | Type        | Options                        |
| ------------- | ----------  | ------------------------------ |
| postal_code   | integer     | null: false                    |
| city          | string      | null: false                    |
| house_number  | integer     | null: false                    |
| building_name | string      | null: false                    |
| user_id       | references  | null: false, foreign_key: true |
| item_id       | references  | null: false, foreign_key: true |
| purchase_id   | references  | null: false, foreign_key: true |

### Association
- belongs_to : user
- belongs_to :purchase
