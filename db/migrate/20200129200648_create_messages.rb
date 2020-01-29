class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :message_content
      t.string :product_description
      t.timestamps
    end
  end
end
