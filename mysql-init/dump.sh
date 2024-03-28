#!/bin/bash

# Read environment variables from Laravel .env file
DB_DATABASE=$(grep DB_DATABASE .env | cut -d '=' -f2-)
DB_USERNAME=$(grep DB_USERNAME .env | cut -d '=' -f2-)
DB_PASSWORD=$(grep DB_PASSWORD .env | cut -d '=' -f2-)

# Generate SQL commands
echo "CREATE DATABASE IF NOT EXISTS $DB_DATABASE;"
echo "CREATE USER '$DB_USERNAME'@'%' IDENTIFIED BY '$DB_PASSWORD';"
echo "GRANT ALL PRIVILEGES ON $DB_DATABASE.* TO '$DB_USERNAME'@'%';"

echo "ALTER USER 'root'@'localhost' IDENTIFIED BY 'securerootpassword';"
echo "FLUSH PRIVILEGES;"

