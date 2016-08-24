#!/bin/bash


export APACHE_RUN_USER=glpi
export APACHE_RUN_GROUP=glpi
export APACHE_PID_FILE=/var/run/apache2/apache2.pid
export APACHE_RUN_DIR=/var/run/apache2
export APACHE_LOCK_DIR=/var/lock/apache2
export APACHE_LOG_DIR=/var/log/apache2

export LANG=C
export LANG

rm -f ${APACHE_PID_FILE}

apache2 -DFOREGROUND
