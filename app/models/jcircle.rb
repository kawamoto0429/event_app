class Jcircle < ApplicationRecord
  belongs_to :circle
  belongs_to :user
  validates_uniqueness_of :circle_id, scope: :user_id
end
