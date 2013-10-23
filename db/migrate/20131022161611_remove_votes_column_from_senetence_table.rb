class RemoveVotesColumnFromSenetenceTable < ActiveRecord::Migration
  def change
    remove_column :sentences, :votes
  end
end
