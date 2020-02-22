class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :messages

  has_many_attached :images
end
