#! /bin/bash

sudo mariadb -u root -p

CREATE USER 'Chef'@'localhost' IDENTIFIED BY 'Chef';
CREATE USER 'User'@'localhost' IDENTIFIED BY 'User';
GRANT ALL PRIVILEGES ON *.* TO 'Chef'@'localhost';
FLUSH PRIVILEGES;
EXIT;
