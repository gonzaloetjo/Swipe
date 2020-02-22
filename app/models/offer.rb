class Offer < ApplicationRecord
  has_many :messages, dependent: :destroy
  accepts_nested_attributes_for :messages, allow_destroy: true

  validates_presence_of :user_id, :product_id
  validates_uniqueness_of :product_id, score: :user_id

  scope :between, -> (user_id, product_id) do
    where("(user_id = ? AND product_id = ?) OR (user_id ? AND product_id = ?)", user_id, product_id, product_id, user_id)
  end

  #belongs_to :product
  #belongs_to :user
end
