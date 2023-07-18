#!/usr/bin/env bash
set -euxo pipefail

# test 環境で作る必要がある
RAILS_ENV="test" bundle exec rails db:import_csv
RAILS_ENV="test" bundle exec rails db:make_up_db
RAILS_ENV="test" bundle exec rspec

exit 0
