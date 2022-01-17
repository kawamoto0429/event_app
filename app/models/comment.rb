class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many :replis, dependent: :destroy
  validates :text, presence: true
end
