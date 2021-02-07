class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :burden
  belongs_to :area
  belongs_to :days

  with_options presence: true do
    validates :image
    validates :name
    validates :expostion
    validates :price
  end

  validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10000000, message: "上記の販売価格を半角数字で入力してください"}


  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :state_id
    validates :burden_id
    validates :area_id
    validates :days_id
  end
end


