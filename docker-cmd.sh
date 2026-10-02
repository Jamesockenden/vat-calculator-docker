#!/bin/sh
set -e

echo "================================="
echo "Starting VAT application"
echo "Container: $(hostname)"
echo "Time: $(date)"
echo "================================="

exec nginx -g "daemon off;"
