# アプリケーション
Okurimono

# アプリケーション概要
プレゼントにおすすめな商品情報をシェアできるWebアプリケーション

# URL
https://okurimono-gift.herokuapp.com/

# テスト用アカウント　　
･Basic認証ID： admin  
・Basic認証パスワード： 2022  
・メールアドレス： test1@example.com  
・パスワード： 111aaa

# 利用方法
## 商品投稿

## タグ付する


# アプリケーションを作成した背景


# 洗い出した要件
[要件を定義したシート](https://docs.google.com/spreadsheets/d/1Xf6_kf8KbsswHch7_SEWj-8VmFZWfwfuc5dovG7RKvA/edit?usp=sharing)

# 実装した機能についての画像やGIFおよびその説明

# 実装予定の機能　　
・フォロー機能  
・お気に入り機能  
・Googleマップ表示機能　　

# データベース設計


# 画面遷移図


# 開発環境　　
・フロントエンド　　
・バックエンド　　
・インフラ　　
・テスト　　
・テキストエディタ　　
・タスク管理　　

# ローカルでの動作方法　　
以下のコマンドを順に実行。　　
% git clone https://github.com/okurimono-gift　　
% cd okurimono-gift　　
% bundle install　　
% yarn install　　

# 工夫したポイント


# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| gender_id          | integer | null: false               |
| prefecture_id      | integer | null: false               |
| introduction       | text    |                           |

### Association

- belongs_to_active_hash :gender
- belongs_to_active_hash :prefecture
- has_many :items
- has_many :comments
- has_many :favorites 
- has_many :followers, class_name: "Follower", foreign_key: "follower_id", dependent: :destroy
- has_many :reverse_of_followers, class_name: "Follower", foreign_key: "followee_id", dependent: :destroy


## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| title        | string     | null: false                    |
| content      | text       | null: false                    |
| price_id     | integer    | null: false                    |
| shop_url     | string     |                                |
| shop_address | string     |                                |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :category
- belongs_to_active_hash :genre
- belongs_to_active_hash :price
- has_many :comments
- has_many :favorites
- has_many :tags, through: :item_tags


## comments テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| view   | text       | null: false                    |
| item   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item


## favorites テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item


## follows テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| follower_id | integer    |                                |
| followee_id | references | null: false, foreign_key: true |

### Association
- belongs_to :follower, class_name: "User" 
- belongs_to :followee, class_name: "User" 


## categories テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| genre_id | integer    | null: false                    |
| item     | references | null: false, foreign_key: true |

### Association

- has_many :items
- belongs_to_active_hash :genre


## tags テーブル

| Column  | Type   | Options                        |
| ------- | ------ | ------------------------------ |
| name    | string | null: false                    |

### Association

- has_many :item_tags
- has_many :items, through: :item_tags

## item_tags テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| tag    | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :tag


## gender
### Association

- has_many :users

## prefecture
### Association

- has_many :users

## price
### Association

- has_many :items

## genre
### Association

- has_many :categories
