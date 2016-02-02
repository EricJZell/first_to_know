class AddLastTweetedToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :last_tweeted, :bigint, default: 0
  end
end
