class RemovePaperclipColumnsFromChampions < ActiveRecord::Migration[7.1]
  def change
    remove_column :champions, :image_file_name, :string
    remove_column :champions, :image_content_type, :string
    remove_column :champions, :image_file_size, :integer
    remove_column :champions, :image_updated_at, :datetime
  end
end
