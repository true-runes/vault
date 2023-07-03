#!/usr/bin/env bash
set -euxo pipefail

bundle exec rails db:download_csv:execute
bundle exec rails db:reconstruction:execute

exit 0
