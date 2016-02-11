# set :output, "/path/to/my/cron_log.log"
#
every 2.minutes do
  rake 'twilio:scan_tweets'
end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end
# Or just put this in your crontab file:
# * * * * * /bin/bash -l -c 'cd /Users/ericzell/challenges/first_to_know && RAILS_ENV=production bundle exec rake twilio:scan_tweets --silent'
# Learn more: http://github.com/javan/whenever
