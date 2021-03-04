# テーブル設計

## users テーブル

| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| first_name     | string | null: false |
| last_name      | string | null: false |
| first_name_kana| string | null: false |
| last_name_kana | string | null: false |
| email          | string | null: false |
| password       | string | null: false |
| nickname       | string | null: false |
| birth_date     | date   | null: false |

### Association

- has_many :items
- has_many :purchase

## items テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| image          | string     | null: false                    |
| name           | string     | null: false                    |
| description    | text       | null: false                    |
| category       | string     | null: false                    |
| status         | string     | null: false                    |
| charges        | string     | null: false                    |
| prefectures    | string     | null: false                    |
| ship_date      | string     | null: false                    |
| price          | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |

### Association

- has_one :purchase
- belongs_to :user

## purchase テーブル

| Column          | Type         | Options                        |
| --------------  | ------------ | ------------------------------ |
| card_number     | integer      | null: false                    |
| expiration_date | integer      | null: false                    |
| security_code   | integer      | null: false                    |
| user            | references   | null: false, foreign_key: true |
| item            | references   | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address

## address テーブル

| Column          | Type         | Options                        |
| --------------- | ------------ | ------------------------------ |
| postal code     | integer      | null: false                    |
| prefectures     | string       | null: false                    |
| municipality    | string       | null: false                    |
| house_number    | string       | null: false                    |
| building_name   | string       | null: false                    |
| phone_number    | integer      | null: false                    |
| purchase        | references   | null: false, foreign_key: true |

### Association

- belongs_to :purchase