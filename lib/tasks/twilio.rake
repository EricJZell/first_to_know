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

end
