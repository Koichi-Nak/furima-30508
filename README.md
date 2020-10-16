# テーブル設計

## users テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| nickname         | string  | null: false |
| email            | string  | null: false |
| password         | string  | null: false |
| family_name_kan  | string  | null: false |
| last_name_kan    | string  | null: false |
| family_name_kana | string  | null: false |
| last_name_kana   | string  | null: false |
| birth_date       | date    | null: false |

### Association

- has_many :items
- has_many :comments


## items テーブル

| Column               | Type          | Options                                |
| -------------------- | ------------- | -------------------------------------- |
| image                | ActiveStorage | null: false                            |
| item_name            | string        | null: false                            |
| description          | text          | null: false                            |
| category             | integer       | null: false                            |
| item_status          | integer       | null: false                            |
| delivery_charge      | integer       | null: false                            |
| shipping_from        | integer       | null: false                            |
| shipping_preparation | integer       | null: false                            |
| price                | integer       | null: false                            |
| user                 | references    | null: false, foreign_key: true         |

### Association

- belongs_to :user
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


## transactions

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| postal_code      | string  | null: false |
| add_pref         | integer | null: false |
| add_muni         | string  | null: false |
| add_local        | string  | null: false |
| add_house        | string  |             |
| phone_num        | integer | null: false |

### Association

- has_one    :order


## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :transaction