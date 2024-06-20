class AddUserRefToChampionsTemporary < ActiveRecord::Migration[7.1]
  def change
    add_reference :champions, :user, null: true, foreign_key: true
  end
end
