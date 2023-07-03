#!/usr/bin/env bash
set -euxo pipefail

scripts/csv_downloader.sh
scripts/reconstruction.sh
scripts/exec_local_rspec.sh

exit 0
