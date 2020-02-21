class ChangeDataMessages3 < ActiveRecord::Migration[5.2]
  def change
    remove_column :messages, :user_id, :integer
    remove_column :messages, :product_id, :integer
    add_reference :messages, :user, foreign_key: true
    add_reference :messages, :product, foreign_key: true
  end
end
