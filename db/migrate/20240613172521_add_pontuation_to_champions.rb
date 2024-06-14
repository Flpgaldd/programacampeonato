class AddPontuationToChampions < ActiveRecord::Migration[7.1]
  def change
    add_column :champions, :pontuation, :string
  end
end
