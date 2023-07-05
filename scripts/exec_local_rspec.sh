#!/usr/bin/env bash
set -euxo pipefail

# test 環境で作る必要がある
RAILS_ENV="test" bundle exec rails db:construction:execute
RAILS_ENV="test" bundle exec rails runner "ImportService::Character.new.execute"
RAILS_ENV="test" bundle exec rspec

exit 0
