#!/usr/bin/env bash
set -euo pipefail

bundle exec rails db:import_csv
bundle exec rails db:make_up_db

exit 0
