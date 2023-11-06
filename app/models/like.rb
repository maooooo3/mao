class Like < ApplicationRecord
  belongs_to :pet
  belongs_to :user
  validates_uniqueness_of :pet_id, scope: :user_id
end
