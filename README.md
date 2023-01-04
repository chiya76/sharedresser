# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| birthday           | date    | null: false               |
| age_id             | integer | null: false               |
| personal_color_id  | integer | null: false               |
| skin_color_id      | integer | null: false               |
| skin_type_id       | integer | null: false               |
| face_type_id       | integer | null: false               |
| makeup_type_id     | integer | null: false               |

## Association
- has_many :items


## items テーブル 
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| category_id        | integer    | null: false                    |
| rating_id          | integer    | null: false                    |
| description        | text       | null: false                    |
| user               | references | null: false, foreign_key: true |

## Association
- belongs_to :user