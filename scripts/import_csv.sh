#!/usr/bin/env bash
set -euo pipefail

bundle exec rails db:import_csv

echo
echo "cf. lib/tasks/reconstruction.rake"

exit 0
