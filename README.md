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
- has_one  :buyer

## buyer テーブル

| Column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| user              | references |             |
| item              | references |             |

### Association

- belongs_to  :user
- belongs_to  :item

## items テーブル

| Column       | Type       | Options     |
| ------------ | -----------| ----------- |
| item_name    | string     | null: false |
| description  | text       | null: false |
| item_details | references |             |
| ship         | references |             |
| price        | string     | null: false |
| user         | references |             |
| category     | string     | null: false |
| condition    | string     | null: false |
| delivery_payer  | string     | null: false |
| ship_area       | string     | null: false |
| ship_day        | string     | null: false |

### Association

- has_many :comments
- belongs_to :users
- has_one :buyer

## comments テーブル

| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| text      | text       | null: false |
| user      | references |             |
| items     | references |             |

### Association

- belongs_to :users
- belongs_to :items