# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nick_name          | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| family_name        | string | null: false               |
| first_name_kana    | string | null: false               |
| family_name_kana   | string | null: false               |
| birth_day          | date   | null: false               |

### Association

- has_many :items
- has_many :comments , through: items
- has_many :buyers

## buyer テーブル

| Column            | Type       | Options           |
| ----------------- | ---------- | ----------------- |
| user              | references | foreign_key: true |
| item              | references | foreign_key: true |

### Association

- has_one :ships_delivery
- belongs_to  :user
- belongs_to  :item

## items テーブル

| Column            | Type       | Options           |
| ----------------- | -----------| ----------------- |
| item_name         | string     | null: false       |
| description       | text       | null: false       |
| category_id       | integer    | null: false       |
| condition_id      | integer    | null: false       |
| price             | string     | null: false       |
| delively_payer_id | integer    | null: false       |
| ship_area_id      | integer    | null: false       |
| ship_day_id       | integer    | null: false       |
| user              | references | foreign_key: true |

### Association

- has_many :comments
- belongs_to :users
- has_one :buyer

## ships_delivery テーブル

| Column                 | Type       | Options           |
| ---------------------- | -----------| ----------------- |
| post_number            | string     | null: false       |
| delivery_city_id       | integer    | null: false       |
| delivery_municipality  | string     | null: false       |
| delivery_address       | string     | null: false       |
| buil_name              | string     |                   |
| phone number           | string     | null: false       |
| buyer                  | references | foreign_key: true |

### Association

- belongs_to :buyer

## comments テーブル

| Column    | Type       | Options           |
| --------- | ---------- | ----------------- |
| text      | text       | null: false       |
| user      | references | foreign_key: true |
| items     | references | foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items