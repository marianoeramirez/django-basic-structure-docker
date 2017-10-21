#!/bin/bash
gcc -shared -fPIC stack-fix.c -o stack-fix.so
export LD_PRELOAD=/code/stack-fix.so

./manage.py migrate
./manage.py runserver 0.0.0.0:8008