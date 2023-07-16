#!/usr/bin/env bash
set -euxo pipefail

# test 環境で作る必要がある
# もし RAILS_ENV=test bundle exec rails runner 'Character.all[123]'  の戻り値が0ならば、
if [ $(RAILS_ENV="test" bundle exec rails runner 'Character.all[123]' | wc -l) -eq 0 ]; then
  RAILS_ENV="test" bundle exec rspec
else
  RAILS_ENV="test" bundle exec rails db:construction:execute
  RAILS_ENV="test" bundle exec rails db:importer:execute
  RAILS_ENV="test" bundle exec rspec
fi

exit 0
