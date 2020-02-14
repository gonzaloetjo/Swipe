class AddMotherCategoryToCategories < ActiveRecord::Migration[5.2]
  def change
    add_reference :categories, :mother_category, index:true
  end
end
