class Micropost < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 255 }
  
  # お気に入り機能追加用中間テーブル追加
  has_many :fevorites, foreign_key: 'micropost_id', dependent: :destroy
  has_many :users, through: :fevorites
  
end