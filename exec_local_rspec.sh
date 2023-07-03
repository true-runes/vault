#!/usr/bin/env bash
set -euxo pipefail

RAILS_ENV="test" bundle exec rails db:reconstruction:execute
RAILS_ENV="test" bundle exec rspec

exit 0
