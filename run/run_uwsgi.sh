#!/bin/bash

cd ..
gcc -shared -fPIC stack-fix.c -o stack-fix.so
cd asante
export LD_PRELOAD=/code/stack-fix.so

./manage.py migrate

uwsgi --ini /code/run/uwsgi.ini