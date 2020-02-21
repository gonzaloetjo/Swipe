class ChangeDataMessages2 < ActiveRecord::Migration[5.2]
  def change
    remove_column :messages, :receiving_user_id, :integer
    remove_column :messages, :sending_user_id, :integer
    add_column :messages, :user_id, :integer, :references => "users"
    add_column :messages, :product_id, :integer, :references => "products"
  end
end
