#!/usr/bin/env bash
set -euxo pipefail

bundle exec rails db:download_csv

exit 0
