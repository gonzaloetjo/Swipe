class Category < ApplicationRecord
  has_many :categories_users
  has_many :products
  #belongs_to :mother_category
end
