#!/bin/bash
set -e

trap "echo TRAPed signal" HUP INT QUIT KILL TERM

slapd -h 'ldap:///' -g openldap -u openldap -d 0 &

exec "$@"
