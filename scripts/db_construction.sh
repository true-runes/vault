#!/usr/bin/env bash
set -euo pipefail

bundle exec rails db:construction:execute

echo
echo "cf. lib/tasks/reconstruction.rake"

exit 0
