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
- has_many :buyer

## buyer テーブル

| Column            | Type       | Options           |
| ----------------- | ---------- | ----------------- |
| user              | references | foreign_key: true |
| item              | references | foreign_key: true |

### Association

- belongs_to  :user
- belongs_to  :item

## items テーブル

| Column       | Type       | Options           |
| ------------ | -----------| ----------------- |
| item_name    | string     | null: false       |
| description  | text       | null: false       |
| category     | integer    | null: false       |
| condition    | integer    | null: false       |
| ship         | references |                   |
| price        | string     | null: false       |
| user         | references | foreign_key: true |
| category     | string     | null: false       |
| condition    | string     | null: false       |

### Association

- has_many :comments
- belongs_to :users
- has_one :buyer
- has_one :ships_delivery

## ships_delivery テーブル

| Column                 | Type       | Options           |
| ---------------------- | -----------| ----------------- |
| delively_payer         | integer    | null: false       |
| ship_area              | integer    | null: false       |
| ship_day               | integer    | null: false       |
| post_number            | string     | null: false       |
| delivery_city          | integer    | null: false       |
| delivery_municipality  | string     | null: false       |
| delivery_address       | string     | null: false       |
| buil_name              | string     | null: false       |
| phone number           | string     | null: false       |
| items                  | references | foreign_key: true |
| buyer                  | references | foreign_key: true |

### Association

- belongs_to :item
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