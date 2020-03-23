#!/usr/bin/env bash

# From now, stop at error
set -euxo pipefail

git config --global user.name developer
git config --global user.email developer@prestashop.local

# Uncomment line below to ignore case-sensitive
#git config --global core.ignorecase true

if ! [ -f /usr/local/bin/composer ]; then
  printf '* Download and install Composer...\n'
  php -r "copy('https://getcomposer.org/installer', '/tmp/composer-setup.php');"
  php /tmp/composer-setup.php --no-ansi --install-dir=/usr/local/bin --filename=composer
  rm -rf /tmp/composer-setup.php
fi

cd /var/www/html

if [ ! -f index.php ]; then
  printf '* Download sources...\n'
  git clone -b develop --depth 1 --progress --verbose https://github.com/PrestaShop/PrestaShop.git .
fi

printf '* Almost! Starting web server now\n'

exec php-fpm
