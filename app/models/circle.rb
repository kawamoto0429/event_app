class Circle < ApplicationRecord
  belongs_to :user
  has_many :jcirles, dependent: :destroy
  has_many :jcircle_users, through: :jcircles, source: :users
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 20 }
  validates :body, presence: true, length: { maximum: 300 }
end
