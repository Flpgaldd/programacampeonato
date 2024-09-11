class CreateTeamchampions < ActiveRecord::Migration[7.1]
  def change
    create_table :teamchampions do |t|
      t.references :team, null: false, foreign_key: true
      t.references :champion, null: false, foreign_key: true

      t.timestamps
    end
  end
end
