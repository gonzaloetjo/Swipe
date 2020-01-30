class AddToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_reference :favorites, :users, foreign_key: true
    add_reference :favorites, :products, foreign_key: true
  end
end
