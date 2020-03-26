#!/usr/bin/env bash

# From now, stop at error
set -euxo pipefail

cd /var/www/html

if [ ! -f index.php ]; then
  printf '* Download sources...\n'
  git clone -b develop --depth 1 --progress --verbose https://github.com/PrestaShop/PrestaShop.git .
fi

printf '* Almost! Starting web server now\n'

exec php-fpm
