require 'twitter'

namespace :twilio do

  desc "Send test text message using Twilio API"
  task test: :environment do

    CLIENT.messages.create(
      from: ENV['TWILIO_PHONE_NUMBER'],
      to: ENV['MY_PHONE_NUMBER'],
      body: 'YO. I am a robot.'
    )
  end

  desc "Test crontab job"
  task cron: :environment do
    File.open('test_cron.txt', 'a') do |f|
      f << "Hi, it's #{Time.now}\n"
    end
  end

  task scan_tweets: :environment do
    TwitterScan.new.call
  end
end
