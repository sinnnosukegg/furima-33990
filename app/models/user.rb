class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

        has_many :items
        has_many :records

        with_options presence: true do
          validates :nickname
          validates :birthday
        end

        with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' } do
          validates :first_name
          validates :last_name
        end

        with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: '全角文字でカナを使用してください' } do
          validates :first_name_kana
          validates :last_name_kana
        end
        
end
