#!/bin/sh
rm -f tmp/pids/server.pid

# startup sidekiq
bundle exec sidekiq -C config/sidekiq.yml -d

# startup rails
bundle exec rails s -b 0.0.0.0 -d

# startup webpacker
./bin/webpack-dev-server