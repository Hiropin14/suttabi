class Favorite < ApplicationRecord
  belongs_to :spot
  belongs_to :user

  validates_uniqueness_of :post_id, scope: :user_id
end
