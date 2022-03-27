class AddImageIdToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :image_id, :string
  end
end
