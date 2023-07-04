#!/usr/bin/env bash
set -euxo pipefail

scripts/csv_downloader.sh
scripts/db_construction.sh
scripts/exec_local_rspec.sh

exit 0
