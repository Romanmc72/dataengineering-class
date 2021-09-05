#!/usr/bin/env bash

set -euo pipefail

main() {
    echo "Destroying the database..."
    docker compose down --remove-orphans
    docker compose rm
}

main
