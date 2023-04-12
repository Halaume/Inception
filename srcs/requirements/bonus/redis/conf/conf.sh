#! /bin/bash

sed s/"bind 127.0.0.1 ::1"/"#bind 127.0.0.1 ::1"/g /etc/redis/redis.conf
sed s/"# maxmemory <bytes>"/"maxmemory 256mb"/g /etc/redis/redis.conf
sed s/"# maxmemory-policy noeviction"/"maxmemory-policy allkeys-lru"/g /etc/redis/redis.conf
sed s/"# requirepass foobared"/"requirepass $REDIS_PW"/g /etc/redis/redis.conf

exec redis-server /etc/redis/redis.conf --daemonize no
