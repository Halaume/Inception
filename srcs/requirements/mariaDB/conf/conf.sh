#! /bin/bash

mariadb -u root -p
CREATE DATABASE wordpress
CREATE USER 'Chef'@'localhost' IDENTIFIED BY 'Chef';
CREATE USER 'User'@'localhost' IDENTIFIED BY 'User';
GRANT ALL PRIVILEGES ON wordpress.* TO 'Chef'@'localhost';
FLUSH PRIVILEGES;
EXIT;
