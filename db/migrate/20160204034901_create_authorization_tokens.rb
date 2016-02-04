class CreateAuthorizationTokens < ActiveRecord::Migration
  def change
    create_table :authorization_tokens do |t|
      t.string :token, null: false
    end
  end
end
