class RemoveStatusColumnFromStoriesTable < ActiveRecord::Migration
  def change
    remove_column :stories, :status
  end
end
