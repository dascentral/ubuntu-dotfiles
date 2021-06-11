#!/usr/bin/env bash

if [ -e "/usr/local/bin/composer" ]; then
    abort "Composer has already been installed. Aborting installation."
fi

curl -sS https://getcomposer.org/installer | php

sudo mv composer.phar /usr/local/bin/composer
