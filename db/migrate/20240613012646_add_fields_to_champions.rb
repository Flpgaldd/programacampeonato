class AddFieldsToChampions < ActiveRecord::Migration[7.1]
  def change
    add_column :champions, :vision, :string
    add_column :champions, :team, :string
    add_column :champions, :match_total, :integer
    add_column :champions, :premiation, :boolean, default: false, null: false
  end
end
