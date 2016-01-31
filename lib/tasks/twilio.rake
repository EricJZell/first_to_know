require 'twitter'

namespace :twilio do

  desc "Send test text message using Twilio API"
  task test: :environment do

    CLIENT = Twilio::REST::Client.new

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

  task twitter_test: :environment do
    CLIENT = Twilio::REST::Client.new
    twitter_client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['CONSUMER_KEY']
      config.consumer_secret = ENV['CONSUMER_KEY_SECRET']
      config.access_token =  ENV['ACCESS_TOKEN']
      config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
    end
    result = twitter_client.friends
    result.each do |friend|
      CLIENT.messages.create(
        from: '+14012878652',
        to: '+14013328093',
        body: "@#{friend.screen_name} tweets: #{friend.status.text}"
      )
    end

  end

end
