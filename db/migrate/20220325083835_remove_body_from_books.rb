class RemoveBodyFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :body, :text
  end
end
