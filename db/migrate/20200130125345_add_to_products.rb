class AddToProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :users, foreign_key: true
    add_reference :products, :categories, foreign_key: true
  end
end
