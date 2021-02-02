# README

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ----------------   | ------ | ------------|
| nickname           | string | NOT NULL    |
| email              | string | NOT NULL    |
| encrypted_password | string | NOT NULL    |
| first_name         | string | NOT NULL    |
| last_name          | string | NOT NULL    |
| first_name_kana    | string | NOT NULL    |
| last_name_kana     | string | NOT NULL    |
| birth_day          | date   | null :false |

### Association
- has_many :items
- has_many :records

## items テーブル

| Column        |  Type        | Options          |
| ----------    | ------------ | ---------------- |
| name          | string       | NOT NULL         |
| exposition    | text         | NOT NULL         |
| category_id   | integer      | NOT NULL         |
| state_id      | integer      | NOT NULL         |
| burden_id     | integer      | NOT NULL         |
| area          | integer      | NOT NULL         |
| days_id       | integer      | NOT NULL         |
| price         | integer      | NOT NULL         |
| user          | references   | foreign_key:true |

### Association
  belongs_to :user
  has_one :records

## record テーブル

| Column  | Type       | Options           |
| ------  | ---------- | ------------------|
| user    | references | foreign_key: true |
| item    | references | foreign_key: true |

### Association
  belongs_to :user
  belongs_to :item
  has_one :deliverys

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
 belongs_to :record