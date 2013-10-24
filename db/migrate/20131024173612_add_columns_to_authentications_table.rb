class AddColumnsToAuthenticationsTable < ActiveRecord::Migration
  def change
    add_column :authentications, :oauth_token, :string
    add_column :authentications, :oauth_expires, :datetime
    add_column :authentications, :oauth_secret, :string
    add_column :authentications, :username, :string
  end
end
