#!/bin/sh
rm -f tmp/pids/server.pid

#start up sidekiq
bundle exec sidekiq -C config/sidekiq.yml -d

# startup rails
bundle exec rails s