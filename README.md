# テーブル設計

## users テーブル

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| nickname    | string | null: false |
| email       | string | null: false |
| password    | string | null: false |
| family_name | string | null: false |
| first_name  | string | null: false |
| family_name | string | null: false |
| first_name  | string | null: false |
| birthday    | date   | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| name         | string     | null: false                    |
| description  | text       | null: false                    |
| category     | string     | null: false                    |
| status       | string     | null: false                    |
| send_price   | integer    | null: false                    |
| prefectures  | string     | null: false                    |
| sending_days | integer    | null: false                    |
| price        | integer    | null: false                    |
| user_id      | references | null: false, foreign_key: true |

### Association

- has_one :purchase
- belongs_to :user

## purchases テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_num      | integer    | null: false                    |
| prefectures   | string     | null: false                    |
| city          | string     | null: false                    |
| address_num   | integer    | null: false                    |
| building_name | string     |                                |
| phone_num     | integer    | null: false                    |
| user_id       | references | null: false, foreign_key: true |
| item_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user