class AddColumnVoteToVote < ActiveRecord::Migration
  def change
    add_column :votes, :vote, :boolean
  end
end
