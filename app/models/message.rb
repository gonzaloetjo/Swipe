class Message < ApplicationRecord
  belongs_to :offer
  belongs_to :user
  belongs_to :product

  validates_presence_of :message_content, :user_id, :product_id
end
