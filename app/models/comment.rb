class Comment < ApplicationRecord
  belongs_to :cafe
  validates :user_id, presence: true
  validates :cafe_id, presence: true
  validates :content, presence: true, length: { maximum: 50 }
end
