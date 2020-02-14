class Favorite < ApplicationRecord
  validates_uniqueness_of :product_id, scope: :user_id
  belongs_to :product
  belongs_to :user
end
