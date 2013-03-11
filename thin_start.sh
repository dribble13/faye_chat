#!/bin/sh

cd /var/www/chat_test

rackup -s thin faye.ru -E production -D -P /var/run/thin/faye.pid
rackup -s thin ws.ru -E production -D -p 8080 -P /var/run/thin/ws.pid