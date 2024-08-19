class AddInviteTokenToTeams < ActiveRecord::Migration[7.1]
  def change
    add_column :teams, :invite_token, :string
  end
end
