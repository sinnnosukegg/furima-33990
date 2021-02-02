# README

# テーブル設計

## users テーブル

| Column      | Type   | Options  |
| ----------- | ------ | ---------|
| nickname    | string | NOT NULL |
| email       | string | NOT NULL |
| password    | string | NOT NULL |
| name        | text   | NOT NULL |
| name_kana   | text   | NOT NULL |
| birth-year  | string | NOT NULL |
| birth-month | string | NOT NULL |
| birth-day   | string | NOT NULL |

## items テーブル

| Column     | Type         | Options     |
| ---------- | ------------ | ----------- |
| image      | string       | NOT NULL    |
| name       | string       | NOT NULL    |
| exposition | text         | NOT NULL    |
| details    | text         | NOT NULL    |
| catesory   | string       | NOT NULL    |
| state      | string       | NOT NULL    |
| burden     | string       | NOT NULL    |
| area       | string       | NOT NULL    |
| days       | string       | NOT NULL    |
| price      | string       | NOT NULL    |
| user       | references   |             |

## comments テーブル

| Column    | Type       | Options  |
| --------- | ---------- | -------- |
| text      | text       | NOT NULL |
| user      | references |          |
| item      | references |          |
｜
