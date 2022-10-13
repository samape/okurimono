# アプリケーション
Okurimono

# アプリケーション概要
プレゼントにおすすめな商品情報をシェアできるWebアプリケーション

# URL
https://okurimono-gift.herokuapp.com/

# テスト用アカウント
・Basic認証ID： admin  
・Basic認証パスワード： 2022  
・メールアドレス： test1@example.com  
・パスワード： 111aaa

# 利用方法
## 商品投稿
1. トップページのヘッダーからユーザー新規登録を行う
2. シェアボタンから、商品の内容（タイトル・商品詳細・カテゴリ・価格帯・販売店の所在・ショップURL・画像）を入力し投稿する

## 他ユーザーの投稿からプレゼント候補を探す
1. トップページに投稿一覧ページに新着順で並ぶ投稿からプレゼント候補を探す
2. トップページのヘッダーの「カテゴリ」ボタンからカテゴリ一覧ページに移動し、各カテゴリの投稿一覧からプレゼント候補を探す

# アプリケーションを作成した背景
自身が日頃から抱えていた課題である、「誰かへのプレゼント選びに悩んでしまい時間がかかってしまう。また、喜ばれるような凝ったプレゼントがなかなか見つけられない。」という悩みを解決したいと思ったことがきっかけである。この課題を分析すると、「様々な人とプレゼントに関する情報をシェアする場」があれば解決できると考えた。家族、友人、同僚など様々なタイプの人へのプレゼントにおすすめな商品の情報をシェアし、プレゼント候補をすぐに見つけられるWebアプリケーションを開発することにした。

# 洗い出した要件
[要件を定義したシート](https://docs.google.com/spreadsheets/d/1Xf6_kf8KbsswHch7_SEWj-8VmFZWfwfuc5dovG7RKvA/edit?usp=sharing)

# 実装した機能についての画像やGIFおよびその説明

# 実装予定の機能　　
・タグ付け機能　　
・フォロー機能 
・フォロー機能 
・フォロー機能  
・お気に入り機能  
・Googleマップ表示機能  

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/f5b9277a6a6eda8926a3af779344719a.png)](https://gyazo.com/f5b9277a6a6eda8926a3af779344719a)

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/aa78e36a1f9915ff5b847dbcd567441e.png)](https://gyazo.com/aa78e36a1f9915ff5b847dbcd567441e)

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
