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
| genre_id     | integer    | null: false                    |
| shop_url     | string     |                                |
| shop_address | string     |                                |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :category
- belongs_to_active_hash :genre
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

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| follower_id | integer |                                |
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

## genre
### Association

- has_many :categories
