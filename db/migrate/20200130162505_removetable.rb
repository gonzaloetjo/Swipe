class Removetable < ActiveRecord::Migration[5.2]
  def change
    drop_table :users_categories
  end
end
