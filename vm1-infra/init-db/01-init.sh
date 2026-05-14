#!/bin/bash
set -e

mysql -u root -p"${MYSQL_ROOT_PASSWORD}" <<-EOSQL
    CREATE DATABASE IF NOT EXISTS cyberwise_user
        CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
    CREATE DATABASE IF NOT EXISTS cyberwise_lms
        CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
    CREATE DATABASE IF NOT EXISTS cyberwise_gophish
        CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

    CREATE USER IF NOT EXISTS '${MYSQL_APP_USER}'@'%'
        IDENTIFIED WITH mysql_native_password BY '${MYSQL_APP_PASSWORD}';

    GRANT ALL PRIVILEGES ON cyberwise_user.*    TO '${MYSQL_APP_USER}'@'%';
    GRANT ALL PRIVILEGES ON cyberwise_lms.*     TO '${MYSQL_APP_USER}'@'%';
    GRANT ALL PRIVILEGES ON cyberwise_gophish.* TO '${MYSQL_APP_USER}'@'%';
    FLUSH PRIVILEGES;
EOSQL
