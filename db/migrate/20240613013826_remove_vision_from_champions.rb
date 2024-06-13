class RemoveVisionFromChampions < ActiveRecord::Migration[7.1]
  def change
    remove_column :champions, :additional_info, :string
  end
end
