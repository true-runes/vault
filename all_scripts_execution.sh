#!/usr/bin/env bash
set -euxo pipefail

scripts/csv_downloader.sh
scripts/import_csv_and_make_up_db.sh
scripts/exec_local_init_rspec.sh

exit 0
