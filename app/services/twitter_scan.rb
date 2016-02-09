class TwitterScan

  def initialize
    ActiveRecord::Base.logger.level = 1
    @friends = TWITTER_CLIENT.friends
  end

  def call
    @friends.each do |friend|
      subscriptions = Subscription.by_user(friend.screen_name)
      subscriptions.each do |subscription|
        if send_text?(friend, subscription)
          update_subscription(subscription, friend.status.id)
          text_the_tweet(friend, subscription)
        end
      end
    end
  end

  def send_text?(friend, subscription)
    friend.status.text.downcase.include?(subscription.phrase) && friend.status.id > subscription.last_tweeted
  end

  def text_the_tweet(friend, subscription)
    CLIENT.messages.create(
      from: ENV['TWILIO_PHONE_NUMBER'],
      to: subscription.user.phone_number,
      body: "@#{friend.screen_name} tweets: #{friend.status.text}"
    )
  end

  def update_subscription(subscription, new_last_tweet_id)
    subscription.last_tweeted = new_last_tweet_id
    subscription.save
  end



end
