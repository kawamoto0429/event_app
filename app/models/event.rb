class Event < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  geocoded_by :address
  after_validation :geocode
  has_many :jevents, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :replies, dependent: :destroy
  has_many :jevent_users, through: :jevents, source: :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 20 }
  validates :body, presence: true, length: { maximum: 500 }
  validates :address, presence: true
  validates :hold, presence: true
  validates :genre_id, presence: true
end
