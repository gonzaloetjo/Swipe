class Removekeysandadd < ActiveRecord::Migration[5.2]
  def change
    remove_reference(:products, :users, foreign_key: true)
    remove_reference(:products, :categories, foreign_key: true)
    remove_reference(:offers, :users, foreign_key: true)
    remove_reference(:offers, :products, foreign_key: true)
    remove_reference(:favorites, :users, foreign_key: true)
    remove_reference(:favorites, :products, foreign_key: true)
    remove_reference(:messages, :offers, foreign_key: true)
    remove_reference(:users_categories, :users, foreign_key: true)
    remove_reference(:users_categories, :categories, foreign_key: true)

    add_reference :products, :user, foreign_key: true
    add_reference :products, :category, foreign_key: true
    add_reference :offers, :user, foreign_key: true
    add_reference :offers, :product, foreign_key: true
    add_reference :favorites, :user, foreign_key: true
    add_reference :favorites, :product, foreign_key: true
    add_reference :messages, :offer, foreign_key: true
    add_reference :users_categories, :user, foreign_key: true
    add_reference :users_categories, :category, foreign_key: true
  end
end
