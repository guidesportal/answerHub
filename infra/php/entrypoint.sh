#!/bin/sh
set -e
cleanup() {
    echo "Running shutdown tasks..."
    php artisan cache:clear
    rm /home/app/.migrated
    rm /home/app/.seeded
    rm /home/app/.installed
}
trap cleanup SIGTERM
if [ ! -f /home/app/.env ]; then
    cp /home/app/.env.example /home/app/.env
fi
if [ ! -f /home/app/.installed ]; then
    composer install --no-interaction --prefer-dist && touch /home/app/.installed
fi
if [ ! -f /home/app/.migrated ]; then
    php artisan migrate:fresh --force && touch /home/app/.migrated
fi
if [ ! -f /home/app/.seeded ]; then
    php artisan db:seed --force && touch /home/app/.seeded
fi
# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
        set -- php "$@"
fi

exec "$@" &
wait $!
