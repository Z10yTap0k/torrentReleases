#!/bin/sh
crond -s /crontabs -f -L /dev/stdout "$@"