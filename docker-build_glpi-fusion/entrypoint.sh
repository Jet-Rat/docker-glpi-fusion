#!/bin/bash


GLPI_DB_CONF='/var/www/glpi/config/config_db.php'

if [ -z "${GLPI_DB_HOST}" ]; then GLPI_DB_HOST='glpi-db';fi
if [ -z "${GLPI_DB_NAME}" ]; then GLPI_DB_NAME='glpi';fi
if [ -z "${GLPI_DB_USER}" ]; then GLPI_DB_USER='glpi';fi
if [ -z "${GLPI_DB_PASS}" ]; then GLPI_DB_PASS='suP3rp244w0rds961p1';fi

sed -i "s/DOCKER_DB_HOST/${GLPI_DB_HOST}/" ${GLPI_DB_CONF};
sed -i "s/DOCKER_DB_NAME/${GLPI_DB_NAME}/" ${GLPI_DB_CONF};
sed -i "s/DOCKER_DB_USER/${GLPI_DB_USER}/" ${GLPI_DB_CONF};
sed -i "s/DOCKER_DB_PASS/${GLPI_DB_PASS}/" ${GLPI_DB_CONF};


service cron stop
rm -f /var/run/crond.pid
service cron start


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
