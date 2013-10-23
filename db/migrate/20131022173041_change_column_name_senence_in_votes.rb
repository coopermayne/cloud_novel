class ChangeColumnNameSenenceInVotes < ActiveRecord::Migration
  def change
    rename_column :votes, :sentence, :sentence_id
  end
end
