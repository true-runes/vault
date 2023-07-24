#!/usr/bin/env bash
set -euxo pipefail

# - DB の構築不備の際に一回実行する
# - test 環境で作る必要がある
# - bundle exec rails db:download_csv は実行されないので注意
RAILS_ENV="test" bundle exec rails db:import_csv
RAILS_ENV="test" bundle exec rails db:make_up_db
RAILS_ENV="test" bundle exec rspec

exit 0
