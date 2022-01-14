class Genre < ApplicationRecord
  has_many :events
  validates :name, presence: true, length: { maximum: 500 }
end
