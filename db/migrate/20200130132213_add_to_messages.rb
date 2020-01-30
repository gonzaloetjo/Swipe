class AddToMessages < ActiveRecord::Migration[5.2]
  def change
    add_reference :messages, :offers, foreign_key: true
    add_column :messages, :receiving_user_id, :integer
    add_column :messages, :sending_user_id, :integer
  end
end
