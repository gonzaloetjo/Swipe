class ChangeDataMessages < ActiveRecord::Migration[5.2]
  def change
    change_column :messages, :message_content, :text
    add_column :messages, :read, :boolean, default: false
  end
end
