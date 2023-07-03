#!/usr/bin/env bash
set -euxo pipefail

bundle exec rails db:reconstruction:execute

exit 0
