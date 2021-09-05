#!/usr/bin/env bash

set -euo pipefail

main() {
    echo "Launching the database..."
    docker compose up -d --build
    echo "Waiting for database to initialize..."
    sleep 3
    echo "Launching web interface"
    echo "  USERNAME: username"
    echo "  PASSWORD: password"
    open http://localhost:9000
}

main
