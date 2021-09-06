# アプリケーション名
  「RAKUKIFU」


# アプリケーション概要
  「RAKUKIFU」は社会貢献型のECサイトです。
  ここに出品される商品の全てが社会貢献につながっている商品であり、
  普段のお買い物と何ら変わらない行動が自然と社会貢献につながります。
  
  また、お買い物につき5%のポイント付与があります。
  取得したポイントを使って弊社が登録している社会貢献団体へ寄付を行うこともできます。


# URL
  https://social-c-app.herokuapp.com  


# テスト用アカウント
  - 一般ユーザー  
    - メールアドレス：a@a, b@b
    - パスワード：asdf1234  

  - 出店店舗  
    - メールアドレス：a@a, n@n  
    - パスワード：asdf1234  

  - 管理者  
    - メールアドレス：a@a.com  
    - パスワード：asdfasdf  


# 利用方法
  - 管理者  
    - テストアカウントでログイン→管理者ページから「寄付先登録」ボタンを押す→寄付先情報を入力→寄付先登録
  
  - 出店店舗  
    - テストアカウントでログイン→出店店舗管理ページヘッダーから「出品する」を押す→商品情報入力→商品出品

  - 一般ユーザー  
    - テストアカウントでログイン→トップページから商品を選択→商品詳細ページから個数を選択しカートに入れる→カートから商品購入ページへ→購入情報入力→商品購入  
    ・テストアカウントでログイン→トップページヘッダーから「寄付する」ボタンを押す→寄付ポイント数を入力→寄付完了


# 目指した課題解決
  - 何をすれば社会貢献になるのかわからない  
   →買い物をするという行為が自動的に寄付につながるようにする。

  - 社会貢献に「面倒・大変」なイメージがある  
    →商品を購入するだけ

  - どのような社会貢献ができるのかわからない  
    →社会貢献をジャンルごとに提示する。

  - 社会貢献の実績がわからない（やってる気にならない、誰かに見てもらいたい）  
    →貢献度の見える化（ポイントや、累計の社会貢献額、ランキングなど）


# 要件定義

  **機能**
  
  - 一般ユーザー  
    - トップページでの商品閲覧機能  
    - 商品詳細ページ閲覧機能  
    - カート機能  
    - 商品購入機能  
    - ポイント寄付機能  
    - マイページ表示機能  
    - プロフィール編集機能  
    - 商品検索機能
    - パンくずリスト機能
    - 商品お気に入り登録機能
    - レビュー投稿機能  
    - おすすめ商品表示機能
  
  - 出店店舗  
    - 店舗管理ページ表示機能  
    - 商品出品機能  
    - 商品編集機能  
    - 商品削除機能  

  - 管理者  
    - 管理者ページ表示機能
    - 寄付先登録機能  
    - 寄付先編集機能  
    - 寄付先削除機能  
    - 売り上げ確認機能  


# 実装済みの機能
  - 一般ユーザー
    - トップページでの商品閲覧機能  
    [![Image from Gyazo](https://i.gyazo.com/88d8644d60d8307af2c11ce0ce445b19.gif)](https://gyazo.com/88d8644d60d8307af2c11ce0ce445b19)  
      - 新着商品の閲覧ができます。
      - 人気商品の閲覧ができます。   
    <br>  
    - 商品詳細ページ閲覧機能  
    [![Image from Gyazo](https://i.gyazo.com/4d685ef639043399919b2657b7a90ab7.gif)](https://gyazo.com/4d685ef639043399919b2657b7a90ab7)  
      - 商品の詳細を確認できます。
      - 商品の個数を選択してカートに入れることができます。  
    <br>
    - カート機能  
    [![Image from Gyazo](https://i.gyazo.com/57653cb6d9fcefe8fb8b3cc6e4502f43.gif)](https://gyazo.com/57653cb6d9fcefe8fb8b3cc6e4502f43)  
    [![Image from Gyazo](https://i.gyazo.com/a489eb488dc55f152435ce596e2853fe.gif)](https://gyazo.com/a489eb488dc55f152435ce596e2853fe)  
    [![Image from Gyazo](https://i.gyazo.com/cb0e9845340162c374d9d075101c9983.gif)](https://gyazo.com/cb0e9845340162c374d9d075101c9983)  
      - カート内の商品を確認することができます。  
      - カート内の商品個数を変更することができます。  
      - カート内の商品を削除することができます。
      - カートを削除することができます。  
    <br>
    - 商品購入機能  
    [![Image from Gyazo](https://i.gyazo.com/a02e10360e55f6cc23d11f5b982c403b.gif)](https://gyazo.com/a02e10360e55f6cc23d11f5b982c403b)  
    [![Image from Gyazo](https://i.gyazo.com/69abeb08d57b7491a19fff443b60060b.png)](https://gyazo.com/69abeb08d57b7491a19fff443b60060b)  
      - 商品情報を入力すると商品を購入することができます。  
    <br>
    - ポイント寄付機能  
    [![Image from Gyazo](https://i.gyazo.com/8d11ba2b3403991fe78cc72a86fb3619.gif)](https://gyazo.com/8d11ba2b3403991fe78cc72a86fb3619)  
      - 適切なポイント数を入力するとポイントを寄付することができます。  
    <br>
    - マイページ表示機能  
    [![Image from Gyazo](https://i.gyazo.com/0f58b66693150581827659c01dffe9a8.gif)](https://gyazo.com/0f58b66693150581827659c01dffe9a8)  
      - ユーザーの保有ポイントが表示されます。 
      - 寄付履歴が表示されます。  
    <br>
    - プロフィール編集機能  
    [![Image from Gyazo](https://i.gyazo.com/96c82543e4529a48180571c26f3d7a0c.gif)](https://gyazo.com/96c82543e4529a48180571c26f3d7a0c)  
      - パスワードを入力せずともユーザー情報を更新することができます。  
    <br>

  - 出店店舗  
    - 店舗管理ページ表示機能  
    [![Image from Gyazo](https://i.gyazo.com/5e69decffb62d07190abeb1b5f83cc88.jpg)](https://gyazo.com/5e69decffb62d07190abeb1b5f83cc88)  
      - 現在の売り上げを確認できます。  
      - 出品済み商品を確認することができます。  
    <br>
    - 商品出品機能  
    [![Image from Gyazo](https://i.gyazo.com/2d754c10843c66f2969eee74b6408189.gif)](https://gyazo.com/2d754c10843c66f2969eee74b6408189)  
      - 商品情報を正しく入力すると商品を出品することができます。  
    <br>
    - 商品編集機能  
    [![Image from Gyazo](https://i.gyazo.com/52c9d623978f7aadf343e38331c6e995.gif)](https://gyazo.com/52c9d623978f7aadf343e38331c6e995)  
      - 商品情報を正しく入力すると商品を編集することができます。  
    <br>
    - 商品削除機能  
    [![Image from Gyazo](https://i.gyazo.com/8d9b44628013460d9dd9fc81679c3a48.gif)](https://gyazo.com/8d9b44628013460d9dd9fc81679c3a48)  
      - 商品編集ページから商品を削除することができます。  
    <br>

  - 管理者  
    - 管理者ページ表示機能  
    [![Image from Gyazo](https://i.gyazo.com/b05312c1b821925a4b18a3bdf28f9e52.jpg)](https://gyazo.com/b05312c1b821925a4b18a3bdf28f9e52)  
      - 現在の売り上げを確認することができます。
      - 各寄付先への総寄付額が表示されます。
      - 出店店舗リストが表示されます。
      - 寄付先リストが表示されます。  
    <br>
    - 寄付先登録機能  
    [![Image from Gyazo](https://i.gyazo.com/87f087a592389f5e21803fa3ce5ad7d8.gif)](https://gyazo.com/87f087a592389f5e21803fa3ce5ad7d8)  
      - 正しい情報を入力すると寄付先を登録できます。  
    <br>
    - 寄付先編集機能  
    [![Image from Gyazo](https://i.gyazo.com/648cf53b6b80de1eb1ec8bb8a2142c1b.gif)](https://gyazo.com/648cf53b6b80de1eb1ec8bb8a2142c1b)  
      - 正しい情報を入力すると寄付先を変更できます。  
    <br>
    - 寄付先削除機能  
    [![Image from Gyazo](https://i.gyazo.com/a41d00f1335123c945cafdead8c9344c.gif)](https://gyazo.com/a41d00f1335123c945cafdead8c9344c)  
      - 寄付先を削除することができます。  


# 実装予定の機能
  - 購入履歴表示
  - 商品検索機能  
  - パンくずリスト機能  
  - 商品お気に入り登録機能  
  - レビュー投稿機能  
  - おすすめ商品表示機能  


# データベース設計  
 **ER図**  
 [![Image from Gyazo](https://i.gyazo.com/6c738a3c75ec7093709d829dd5916c24.png)](https://gyazo.com/6c738a3c75ec7093709d829dd5916c24)



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
| points             | integer    | default: 0                  |

### Association

- has_many :purchase_histories
- has_many :donation_histories
- has_one :cart
- has_many :product_purchase_histories


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


## admins テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association

- has_many :sc_groups


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
- belongs_to :corporation_user
- has_many :product_purchase_histories
- has_many :purchase_histories, through: :product_purchase_histories


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
- has_many :cart_items, dependent: :destroy
- has_many :products, through: :cart_items


## product_purchase_histories テーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| product          | references | foreign_key: true |
| purchase_history | references | foreign_key: true |
| quantity         | integer    | default: 0        |
| user             | references | foreign_key: true |

### Association

- belongs_to :product
- belongs_to :purchase_history
- belongs_to :user


## purchase_histories テーブル

| Column       | Type       | Options           |
| ------------ | ---------- | ----------------- |
| total_price  | integer    | null: false       |
| total_charge | integer    | null: false       |
| user         | references | foreign_key: true |
| product      | references | foreign_key: true |
| points       | integer    |                   |

### Association

- belongs_to :user
- has_many :product_purchase_histories
- has_many :products, through: :product_purchase_histories
- has_one :address


## donation_histories テーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| user   | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :sc_group


## sc_groups テーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| name             | string     | null: false       |
| introduction     | text       | null :false       |
| how_donation     | text       | null :false       |
| admin            | references | foreign_key: true |
| donation_history | references | foreign_key: true |

### Association

- belongs_to :admin
- has_one :donation_history


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


# ローカルでの動作方法  
## 開発環境
 - Ruby 2.6.5
 - Ruby on Rails 6.0.0  
 
  `% git clone https://github.com/nishipee/sc_app.git`  
  `% cd sc_app`  
  `% bundle install`  
  `% yarn install`  
  `% rails db:create`  
  `% rails db:migrate`  
  `% rails s`
