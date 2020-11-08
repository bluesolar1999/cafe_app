class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :cafe
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :cafe_id, presence: true
end
