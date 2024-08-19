class CreateTeams < ActiveRecord::Migration[7.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.text :description
      t.string :site
      t.string :instagram
      t.string :facebook
      t.string :linkedin

      t.timestamps
    end
  end
end
