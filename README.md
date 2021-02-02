# README

# テーブル設計

## users テーブル

| Column             | Type   | Options  |
| ----------------   | ------ | ---------|
| nickname           | string | NOT NULL |
| email              | string | NOT NULL |
| encrypted_password | string | NOT NULL |
| first_name         | string | NOT NULL |
| last_name          | string | NOT NULL |
| first_name_kana    | string | NOT NULL |
| last_name_kana     | string | NOT NULL |
| birth-day          | date   | NOT NULL |

### Association
- has_many :items
- has_many :trans

## items テーブル

| Column        |  Type        | Options          |
| ----------    | ------------ | ---------------- |
| name          | string       | NOT NULL         |
| exposition_id | integer      | NOT NULL         |
| catesory_id   | integer      | NOT NULL         |
| state_id      | integer      | NOT NULL         |
| burden_id     | integer      | NOT NULL         |
| area          | integer      | NOT NULL         |
| days_id       | integer      | NOT NULL         |
| price         | integer      | NOT NULL         |
| user          | references   | foreign_key:true |

### Association
  belongs_to :user
  has_one :trans

## trans テーブル

| Column  | Type       | Options           |
| ------  | ---------- | ------------------|
| user_id | references | foreign_key: true |
| item_id | references | foreign_key: true |

### Association
  belongs_to :user
  belongs_to :item
  has_one :delivery

## delivery テーブル

| Column     | Type       | Options           |
| ---------- | -----------| ----------------- |
| postal     | string     | NOT NULL          |
| area       | integer    | NOT NULL          |
| city       | string     | NOT NULL          |
| addres     | string     | NOT NULL          |
| build      | string     |                   |
| call       | string     | NOT NULL          |
| user       | references | foreign_key: true |
| item       | references | foreign_key: true |

### Association
 belongs_to :trans