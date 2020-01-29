class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :product_description
      t.string :product_photos
      t.string :state
      t.integer :quantity_per_unit

      t.timestamps
    end
  end
end
