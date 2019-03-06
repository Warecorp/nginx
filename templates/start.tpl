#!/bin/bash
/usr/local/bin/dockerize -wait tcp://{{ getenv "NGINX_BACKEND_HOST"}}:{{ getenv "NGINX_BACKEND_PORT"}}
sudo nginx