class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :offers
  has_many :products
  has_many :offers
  has_many :favorites
  has_many :categories_users
  has_many :messages

  has_one_attached :avatar

  def favorites
    @favorites = Favorite.where(user_id: current_user.id).map(&:product_id)
  end
end
