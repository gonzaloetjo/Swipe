class Product < ApplicationRecord
  belongs_to :users
  belongs_to :categories
end
