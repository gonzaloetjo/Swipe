class CreateUsersCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :users_categories do |t|
      t.references  :users, foreign_key: true
      t.references  :categories, foreign_key: true
    end
  end
end
