class AddAuthorizationTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :authorization_token, :string, null: false, default: "haha dude"
  end
end
