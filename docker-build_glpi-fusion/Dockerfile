FROM debian:8.6


ENV GLPI_VERSION 9.1.1
ENV GLPI_HOME /var/www/glpi

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		wget \
	&& wget --no-check-certificate --progress=bar:force https://github.com/glpi-project/glpi/releases/download/${GLPI_VERSION}/glpi-${GLPI_VERSION}.tgz \
	&& mkdir -pv ${GLPI_HOME} \
	&& echo "Extracting GLPI archive glpi-${GLPI_VERSION}.tgz" \
	&& tar -C ${GLPI_HOME} -xvzf glpi-${GLPI_VERSION}.tgz --strip 1 \
	&& echo "Extraction finished" \
	&& rm -rf /var/lib/apt/lists/* glpi-${GLPI_VERSION}.tar.gz


RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		apache2 \
		cron \
		php5 \
		php5-cli \
		php5-curl \
		php5-gd \
		php5-imap \
		php5-ldap \
		php5-mysql \
		wget \
	&& php5enmod imap \
	&& rm -rf /var/lib/apt/lists/*


COPY 000-default.conf /etc/apache2/sites-available


ENV FUSIONINV_VERSION 9.1_1.0

COPY cron_fusioninventory_jobs /tmp

RUN wget --no-check-certificate --progress=bar:force https://github.com/fusioninventory/fusioninventory-for-glpi/releases/download/glpi9.1%2B1.0/fusioninventory-for-glpi_9.1.1.0.tar.gz \
	&& tar -C ${GLPI_HOME}/plugins -xvzf fusioninventory-for-glpi_9.1.1.0.tar.gz \
	&& rm -f fusioninventory-for-glpi_9.1.1.0.tar.gz \
	&& cat /tmp/cron_fusioninventory_jobs | crontab - \
	&& rm /tmp/cron_fusioninventory_jobs


COPY config_db.php ${GLPI_HOME}/config/config_db.php


RUN useradd -G www-data -d ${GLPI_HOME} glpi \
	&& chown -R www-data:www-data ${GLPI_HOME}


ENV ENTRYPOINT_FILE /usr/local/sbin/entrypoint.sh
COPY entrypoint.sh ${ENTRYPOINT_FILE}
RUN chmod 554 ${ENTRYPOINT_FILE} \
	&& ln -s ${ENTRYPOINT_FILE} /entrypoint.sh


VOLUME /var/www/glpi

EXPOSE 80
CMD ["entrypoint.sh"]
