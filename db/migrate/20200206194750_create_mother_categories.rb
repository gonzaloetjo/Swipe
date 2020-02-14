class CreateMotherCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :mother_categories do |t|

      t.timestamps
    end
  end
end
