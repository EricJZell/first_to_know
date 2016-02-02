require 'twitter'

namespace :twilio do

  desc "Send test text message using Twilio API"
  task test: :environment do

    CLIENT.messages.create(
      from: '+14012878652',
      to: '+14013328093',
      body: 'YO. I am a robot.'
    )
  end

  desc "Test crontab job"
  task cron: :environment do
    File.open('test_cron.txt', 'a') do |f|
      f << "Hi, it's #{Time.now}\n"
    end
  end

  task monitor_tweets: :environment do
    friends = TWITTER_CLIENT.friends
    friends.each do |friend|
      subscriptions = Subscription.by_user(friend.screen_name)
      subscriptions.each do |subscription|
        if friend.status.text.downcase.include?(subscription.phrase)
          if friend.status.id > subscription.last_tweeted
            CLIENT.messages.create(
              from: ENV['TWILIO_PHONE_NUMBER'],
              to: ENV['MY_PHONE_NUMBER'],
              body: "@#{friend.screen_name} tweets: #{friend.status.text}"
            )
            subscription.last_tweeted = friend.status.id
            subscription.save
          end
        end
      end
    end
  end
end
