class Removekeysuserscategories < ActiveRecord::Migration[5.2]
  def change
    remove_reference(:users_categories, :user, foreign_key: true)
    remove_reference(:users_categories, :category, foreign_key: true)
  end
end
