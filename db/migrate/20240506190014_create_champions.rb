class CreateChampions < ActiveRecord::Migration[7.1]
  def change
    create_table :champions do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.string :game_type
      t.text :description
      t.text :rules
      t.text :additional_info

      t.timestamps
    end
  end
end
