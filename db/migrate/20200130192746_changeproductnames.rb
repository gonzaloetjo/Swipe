class Changeproductnames < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :product_name, :name
    rename_column :products, :product_description, :description
    remove_column :products, :product_photos
  end
end
