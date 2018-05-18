class RemoveUserFromTeams < ActiveRecord::Migration[5.2]
  def change
    remove_reference :teams, :user, foreign_key: true
  end
end
