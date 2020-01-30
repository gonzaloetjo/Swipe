class Category < ApplicationRecord
  has_many :categories_users
  has_many :products
end
