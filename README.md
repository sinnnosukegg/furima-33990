# README

# テーブル設計

## users テーブル

| Column             | Type   | Options  |
| ----------------   | ------ | ---------|
| nickname           | string | NOT NULL |
| encrypted_password | string | NOT NULL |
| first_name         | string | NOT NULL |
| last_name          | string | NOT NULL |
| first_name_kana    | string | NOT NULL |
| last_name_kana     | string | NOT NULL |
| birth-day          | date   | NOT NULL |

## items テーブル

| Column     | Type         | Options     |
| ---------- | ------------ | ----------- |
| name       | string       | NOT NULL    |
| exposition | integer        | NOT NULL    |
| catesory   | integer       | NOT NULL    |
| state      | integer       | NOT NULL    |
| burden     | integer      | NOT NULL    |
| area       | integer       | NOT NULL    |
| days       | integer       | NOT NULL    |
| price      | string       | NOT NULL    |
| user       | references   | foreign_key: true |

## trans テーブル

| Column | Type       | Options           |
| ------ | ---------- | ------------------|
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |

## delivery テーブル

| Column     | Type       | Options           |
| ---------- | -----------| ----------------- |
| postal     | string     | NOT NULL          |
| ken        | integer    | NOT NULL          |
| city       | string     | NOT NULL          |
| addres     | string     | NOT NULL          |
| build      | string     |                   |
| call       | string     | NOT NULL          |
| user       | references | foreign_key: true |
| item       | references | foreign_key: true |


