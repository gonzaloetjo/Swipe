class AddToOffers < ActiveRecord::Migration[5.2]
  def change
    add_reference :offers, :users, foreign_key: true
    add_reference :offers, :products, foreign_key: true
  end
end
