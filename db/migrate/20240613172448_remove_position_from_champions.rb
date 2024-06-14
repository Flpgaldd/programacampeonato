class RemovePositionFromChampions < ActiveRecord::Migration[7.1]
  def change
    remove_column :champions, :position, :string
  end
end
