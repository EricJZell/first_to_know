class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :user_id, null: false
      t.string :twitter_handle, null: false
      t.string :phrase, null: false
    end
  end
end
