class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many :replies, dependent: :destroy
  validates :text, presence: true
end
