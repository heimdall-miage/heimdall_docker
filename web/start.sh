#!/bin/bash
# Init project dir
if [ ! -d "/home/www/heimdall_web" ]; then
    echo "-- First container startup --"
    git clone https://github.com/heimdall-watch/heimdall_web.git /home/www/heimdall_web
    chown -R heimdall:www-data /home/www/heimdall_web

    if [[ ${APP_ENV} == "dev" ]]; then
        echo "-- Dev env --"
        mv ${PHP_INI_DIR}/php.ini-development ${PHP_INI_DIR}/php.ini
        # To be able to easily modify the project files from the host
        chmod -R 777 /home/www/heimdall_web
    else
        echo "-- Prod env --"
        mv ${PHP_INI_DIR}/php.ini-production ${PHP_INI_DIR}/php.ini
    fi

    sudo -u heimdall composer install -d /home/www/heimdall_web
    FIXTURES_GRP=${APP_ENV}Fixtures
    sudo -u heimdall /home/www/heimdall_web/bin/console doctrine:schema:update --force
    sudo -u heimdall /home/www/heimdall_web/bin/console doctrine:fixtures:load --group=${FIXTURES_GRP^}
fi

apache2-foreground