class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.boolean :status

      t.timestamps
    end
  end
end
