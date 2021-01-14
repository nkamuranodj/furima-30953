# テーブル設計

## users テーブル

| Column            | Type   | Options     |
| ----------------- | ------ | ----------- |
| nick_name         | string | null: false |
| email             | string | null: false |
| password          | string | null: false |

### Association

- has_many :items
- has_many :comments , through: items
- has_one  :profile
- has_one  :buyer

## profile テーブル

| Column            | Type   | Options     |
| ----------------- | ------ | ----------- |
| first_name        | string | null: false |
| family_name       | string | null: false |
| first_name_kana   | string | null: false |
| family_name_kana  | string | null: false |
| birth_year        | date   | null: false |
| birth_month       | date   | null: false |
| birth_day         | date   | null: false |

### Association

- belongs_to  :user

## buyer テーブル

| Column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| user              | references |             |
| item              | references |             |
| credit_card       | references |             |

### Association

- belongs_to  :user
- belongs_to  :item
- has_one     :credit_card

## credit_card テーブル

| Column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| card_number       | string     | null: false |
| expiration_year   | date       | null: false |
| expiration_month  | date       | null: false |
| security_code     | string     | null: false |


### Association

- belongs_to  :buyer

## items テーブル

| Column       | Type       | Options     |
| ------------ | -----------| ----------- |
| item_name    | string     | null: false |
| description  | text       | null: false |
| item_details | references |             |
| ship         | references |             |
| price        | string     | null: false |
| user         | references |             |

### Association

- has_many :comments
- belongs_to :users
- has_one :buyer
- has_one :item_details
- has_one :ships

## item_details テーブル

| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| category  | string     | null: false |
| condition | string     | null: false |

### Association

- belongs_to :items

## ship テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| delivery_payer  | string     | null: false |
| ship_area       | string     | null: false |
| ship_day        | string     | null: false |

### Association

- belongs_to :items

## comments テーブル

| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| text      | text       | null: false |
| user      | references |             |
| items     | references |             |

### Association

- belongs_to :users
- belongs_to :items