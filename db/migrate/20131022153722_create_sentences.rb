class CreateSentences < ActiveRecord::Migration
  def change
    create_table :sentences do |t|
      t.text :text
      t.integer :votes
      t.integer :story_id
      t.integer :user_id

      t.timestamps
    end
  end
end
