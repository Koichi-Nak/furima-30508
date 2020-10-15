# テーブル設計

## users テーブル

| Column           | Type    | Options                         |
| ---------------- | ------- | ------------------------------- |
| nickname         | string  | null: false                     |
| email            | string  | null: false                     |
| password         | string  | null: false, minimumlength: "6" |
| family_name_kan  | string  | null: false                     |
| last_name_kan    | string  | null: false                     |
| family_name_kana | string  | null: false                     |
| last_name_kana   | string  | null: false                     |
| birth_year       | integer | null: false, list               |
| birth_month      | integer | null: false, maxlength: "2"     |
| birth_day        | integer | null: false, maxlength: "2"     |

### Association

- has_many :items
- has_many :transactions
- has_many :comments


## items テーブル

| Column               | Type          | Options                                |
| -------------------- | ------------- | -------------------------------------- |
| image                | ActiveStorage | null: false                            |
| item_name            | string        | null: false                            |
| description          | text          | null: false                            |
| category             | string        | null: false, list                      |
| item_status          | string        | null: false, list                      |
| delivery_charge      | string        | null: false, list                      |
| shipping_from        | string        | null: false, list                      |
| shipping_preparation | string        | null: false, list                      |
| price                | integer       | null: false  300 <= price >= 9,999,999 |
| user                 | references    | null: false, foreign_key: true         |

### Association

- belongs_to :user
- has_one    :transaction
- has_many   :comments


## comments テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :prototype


## Transaction

| Column           | Type       | Options                                 |
| ---------------- | ---------- | --------------------------------------- |
| credit_num       | integer    | null: false, maxlength: "16"            |
| expiration_month | integer    | null: false, maxlength: "2"             |
| expiration_year  | integer    | null: false, maxlength: "2"             |
| security_code    | integer    | null: false, maxlength: "4"             |
| postal_code      | string     | null: false, match(/\A\d{3}[-]\d{4}\z/) |
| add_pref         | string     | null: false, list                       |
| add_muni         | string     | null: false                             |
| add_local        | string     | null: false                             |
| add_house        | string     |                                         |
| phone_num        | integer    | null: false, maxlength: "11"            |
| user             | references | null: false, foreign_key: true          |
| item             | references | null: false, foreign_key: true          |

### Association

- belongs_to :user
- belongs_to :item