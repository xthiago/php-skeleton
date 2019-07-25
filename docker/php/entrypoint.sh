#!/usr/bin/env ash
set -e

composer install

exec "$@"