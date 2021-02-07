# README

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ----------------   | ------ | ------------|
| nickname           | string | null :false |
| email              | string | null :false |
| encrypted_password | string | null :false |
| first_name         | string | null :false |
| last_name          | string | null :false |
| first_name_kana    | string | null :false |
| last_name_kana     | string | null :false |
| birth_day          | date   | null :false |

### Association
- has_many :items
- has_many :records

## items テーブル

| Column        |  Type        | Options          |
| ----------    | ------------ | ---------------- |
| name          | string       | null :false      |
| expostion     | text         | null :false      |
| category_id   | integer      | null :false      |
| state_id      | integer      | null :false      |
| burden_id     | integer      | null :false      |
| area_id       | integer      | null :false      |
| days_id       | integer      | null :false      |
| price         | integer      | null :false      |
| user          | references   | foreign_key:true |

### Association
  belongs_to :user
  has_one :record

## records テーブル

| Column    | Type       | Options           |
| --------  | ---------- | ------------------|
| user      | references | foreign_key: true |
| item      | references | foreign_key: true |

### Association
  belongs_to :user
  belongs_to :item
  has_one :delivery

## deliveries テーブル

| Column     | Type       | Options           |
| ---------- | -----------| ----------------- |
| postal     | string     | null :false       |
| area_id    | integer    | null :false       |
| city       | string     | null :false       |
| addres     | string     | null :false       |
| build      | string     |                   |
| call       | string     | null :false       |
| record     | references | foreign_key: true |

### Association
 belongs_to :record