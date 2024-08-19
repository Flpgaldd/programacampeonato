class RemovePaperclipColumnsFromTeams < ActiveRecord::Migration[7.1]
  def change
    remove_column :teams, :image_file_name, :string
    remove_column :teams, :image_content_type, :string
    remove_column :teams, :image_file_size, :integer
    remove_column :teams, :image_updated_at, :datetime
  end
end
