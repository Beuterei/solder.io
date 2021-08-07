#!/bin/bash

cd /var/www/html

salt="Solder.cf"
author_pass=$(echo -n $SOLDER_AUTHOR_PASS$salt | sha256sum | awk '{print $1}')


# sed config file
rm functions/config.php
cat <<EOF >>functions/config.php
<?php
    return array(
        "configured" => true,
        "author" => "${SOLDER_AUTHOR}",
        "mail" => "${SOLDER_AUTHOR_EMAIL}",
        "pass" => "${author_pass}",
        "db-host" => "${SOLDER_DB_HOST}",
        "db-user" => "${SOLDER_DB_USER}",
        "db-name" => "${SOLDER_DB_NAME}",
        "db-pass" => "${SOLDER_DB_PASS}",
        "host" => "${SOLDER_HOST}",
        "dir" => "${SOLDER_DIR}",
        "api_key" => "${SOLDER_API_KEY}",
        "encrypted" => "${SOLDER_ENCRYPTED}"
    );
EOF

/usr/sbin/apache2 -D FOREGROUND