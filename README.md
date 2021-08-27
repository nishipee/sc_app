# テーブル設計

## users テーブル

| Column             | Type       | Options                     |
| ------------------ | ---------- | --------------------------- |
| nickname           | string     | null: false                 |
| email              | string     | null: false, unique: true   |
| encrypted_password | string     | null: false                 |
| birthday           | date       |                             |
| postcode           | string     |                             |
| prefecture_id      | integer    |                             |
| city               | string     |                             |
| house_number       | string     |                             |
| building_name      | string     |                             |
| phone_num          | string     |                             |

### Association

- has_many :purchase_histories
- has_many :donation_histories
- has_many :cart_items
- has_one :point


## corporation_users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| name               | string  | null: false               |
| postcode           | string  | null: false               |
| prefecture_id      | integer | null: false               |
| city               | string  | null: false               |
| house_number       | string  | null: false               |
| building_name      | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| phone_num          | string  | null: false               |

### Association

- has_many :products


## admin_users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association
- has_many :donation_destinations


## products テーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| name             | string     | null: false       |
| introduction     | text       | null: false       |
| category1_id     | integer    | null: false       |
| category2_id     | integer    | null: false       |
| category3_id     | integer    | null: false       |
| charge_id        | integer    | null: false       |
| prefecture_id    | integer    | null: false       |
| scheduled_day_id | integer    | null: false       |
| price            | integer    | null: false       |
| corporation_user | references | foreign_key: true |
| sold_num         | integer    | default: 0        |

### Association

- has_many :cart_items
- has_many :carts, through: :cart_items
- belongs_to :corporation_user
- has_one :purchase_history


## cart_itemsテーブル

| Column   | Type       | Options           |
| -------- | ---------- | ----------------- |
| product  | references | foreign_key: true |
| cart     | references | foreign_key: true |
| quantity | integer    | default: 0        |

### Association

- belongs_to :product
- belongs_to :cart


## carts テーブル

| Column       | Type       | Options           |
| ------------ | ---------- | ----------------- |
| user         | references | foreign_key: true |

### Association

- belongs_to :user
- has_many :cart_items
- has_many :products, through: :cart_items


## purchase_histories テーブル

| Column       | Type       | Options           |
| ------------ | ---------- | ----------------- |
| products_num | integer    |                   |
| total_price  | integer    |                   |
| total_charge | integer    |                   |
| user         | references | foreign_key: true |
| product      | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one :address
- has_one :point


## donation_histories テーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| user   | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :donation_destination
- has_one :point


## donation_destinations テーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| name               | string     | null: false       |
| introduction       | text       | null :false       |
| donation_per_point | text       | null :false       |
| admin_user         | references | foreign_key: true |
| donation_history   | references | foreign_key: true |

### Association

- belongs_to :admin_user
- belongs_to :donation_history


## points テーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| point            | integer    |                   |
| user             | references | foreign_key: true |
| purchase_history | references | foreign_key: true |
| donation_history | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :purchase_history
- belongs_to :donation_history


## addresses テーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| postcode         | string     | null: false       |
| prefecture_id    | integer    | null: false       |
| city             | string     | null: false       |
| house_number     | string     | null: false       |
| building_name    | string     |                   |
| phone_num        | string     | null: false       |
| purchase_history | references | foreign_key: true |

### Association

- belongs_to :purchase_history
