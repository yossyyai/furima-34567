# テーブル設計

## users テーブル

| Column                   | Type   | Options     |
| ------------------------ | ------ | ----------- |
| first_name               | string | null: false |
| last_name                | string | null: false |
| first_name_kana          | string | null: false |
| last_name_kana           | string | null: false |
| email                    | string | null: false |
| encrypted_password       | string | null: false |
| nickname                 | string | null: false |
| birth_date               | date   | null: false |

### Association

- has_many :items
- has_many :purchase

## items テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| name           | string     | null: false                    |
| description    | text       | null: false                    |
| category_id    | integer    | null: false                    |
| status_id      | integer    | null: false                    |
| charges_id     | integer    | null: false                    |
| prefectures_id | integer    | null: false                    |
| ship_date_id   | integer    | null: false                    |
| price          | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |

### Association

- has_one :purchase
- belongs_to :user

## purchase テーブル

| Column          | Type         | Options                        |
| --------------- | ------------ | ------------------------------ |
| user            | references   | null: false, foreign_key: true |
| item            | references   | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address

## address テーブル

| Column          | Type         | Options                        |
| --------------- | ------------ | ------------------------------ |
| postal_code     | string       | null: false                    |
| prefectures_id  | integer      | null: false                    |
| municipality    | string       | null: false                    |
| house_number    | string       |                                |
| building_name   | string       | null: false                    |
| phone_number    | string       | null: false                    |
| purchase        | references   | null: false, foreign_key: true |

### Association

- belongs_to :purchase