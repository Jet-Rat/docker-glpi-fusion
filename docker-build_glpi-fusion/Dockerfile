FROM debian:8.7


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

COPY config_db.php ${GLPI_HOME}/config/config_db.php

COPY cron_glpi_jobs /tmp/cron/cron_glpi_jobs



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
	&& rm -rf /var/lib/apt/lists/* \
	&& mkdir -pv /tmp/cron


COPY 000-default.conf /etc/apache2/sites-available



ENV FUSIONINV_PLUGIN_VERSION 9.1_1.0

RUN wget --no-check-certificate --progress=bar:force https://github.com/fusioninventory/fusioninventory-for-glpi/releases/download/glpi9.1%2B1.0/fusioninventory-for-glpi_9.1.1.0.tar.gz \
	&& tar -C ${GLPI_HOME}/plugins -xvzf fusioninventory-for-glpi_9.1.1.0.tar.gz \
	&& rm -f fusioninventory-for-glpi_9.1.1.0.tar.gz



ENV ACCOUNTS_PLUGIN_VERSION 2.2.0

RUN wget --no-check-certificate --progress=bar:force https://github.com/InfotelGLPI/accounts/releases/download/${ACCOUNTS_PLUGIN_VERSION}/glpi-accounts-${ACCOUNTS_PLUGIN_VERSION}.tar.gz \
	&& tar -C ${GLPI_HOME}/plugins -xvzf glpi-accounts-${ACCOUNTS_PLUGIN_VERSION}.tar.gz \
	&& rm -f glpi-accounts-${ACCOUNTS_PLUGIN_VERSION}.tar.gz



ENV APPLIANCES_PLUGIN_VERSION 2.2.1

RUN wget --no-check-certificate --progress=bar:force https://forge.glpi-project.org/attachments/download/2168/glpi-appliances-${APPLIANCES_PLUGIN_VERSION}.tar.gz \
	&& tar -C ${GLPI_HOME}/plugins -xvzf glpi-appliances-${APPLIANCES_PLUGIN_VERSION}.tar.gz \
	&& rm -f glpi-appliances-${APPLIANCES_PLUGIN_VERSION}.tar.gz



ENV CERTIFICATES_PLUGIN_VERSION 2.2.0

RUN wget --no-check-certificate --progress=bar:force https://github.com/InfotelGLPI/certificates/releases/download/${CERTIFICATES_PLUGIN_VERSION}/glpi-certificates-${CERTIFICATES_PLUGIN_VERSION}.tar.gz \
	&& tar -C ${GLPI_HOME}/plugins -xvzf glpi-certificates-${CERTIFICATES_PLUGIN_VERSION}.tar.gz \
	&& rm -f glpi-certificates-${CERTIFICATES_PLUGIN_VERSION}.tar.gz



ENV DATABASES_PLUGIN_VERSION 1.9.0

RUN wget --no-check-certificate --progress=bar:force https://github.com/InfotelGLPI/databases/releases/download/${DATABASES_PLUGIN_VERSION}/glpi-databases-${DATABASES_PLUGIN_VERSION}.tar.gz \
	&& tar -C ${GLPI_HOME}/plugins -xvzf glpi-databases-${DATABASES_PLUGIN_VERSION}.tar.gz \
	&& rm -f glpi-databases-${DATABASES_PLUGIN_VERSION}.tar.gz



ENV DOMAINS_PLUGIN_VERSION 1.8.0

RUN wget --no-check-certificate --progress=bar:force https://github.com/InfotelGLPI/domains/releases/download/${DOMAINS_PLUGIN_VERSION}/glpi-domains-${DOMAINS_PLUGIN_VERSION}.tar.gz \
	&& tar -C ${GLPI_HOME}/plugins -xvzf glpi-domains-${DOMAINS_PLUGIN_VERSION}.tar.gz \
	&& rm -f glpi-domains-${DOMAINS_PLUGIN_VERSION}.tar.gz



ENV MYDASHBOARD_PLUGIN_VERSION 1.3.2

RUN wget --no-check-certificate --progress=bar:force https://github.com/InfotelGLPI/mydashboard/releases/download/${MYDASHBOARD_PLUGIN_VERSION}/glpi-mydashboard-${MYDASHBOARD_PLUGIN_VERSION}.tar.gz \
	&& tar -C ${GLPI_HOME}/plugins -xvzf glpi-mydashboard-${MYDASHBOARD_PLUGIN_VERSION}.tar.gz \
	&& rm -f glpi-mydashboard-${MYDASHBOARD_PLUGIN_VERSION}.tar.gz



ENV POSITIONS_PLUGIN_VERSION 4.3.1

RUN wget --no-check-certificate --progress=bar:force https://github.com/InfotelGLPI/positions/releases/download/${POSITIONS_PLUGIN_VERSION}/glpi-positions-${POSITIONS_PLUGIN_VERSION}.tar.gz \
	&& tar -C ${GLPI_HOME}/plugins -xvzf glpi-positions-${POSITIONS_PLUGIN_VERSION}.tar.gz \
	&& rm -f glpi-positions-${POSITIONS_PLUGIN_VERSION}.tar.gz



ENV WEBAPPLICATIONS_PLUGIN_VERSION 2.3.0

RUN wget --no-check-certificate --progress=bar:force https://github.com/InfotelGLPI/webapplications/releases/download/${WEBAPPLICATIONS_PLUGIN_VERSION}/glpi-webapplications-${WEBAPPLICATIONS_PLUGIN_VERSION}.tar.gz \
	&& tar -C ${GLPI_HOME}/plugins -xvzf glpi-webapplications-${WEBAPPLICATIONS_PLUGIN_VERSION}.tar.gz \
	&& rm -f glpi-webapplications-${WEBAPPLICATIONS_PLUGIN_VERSION}.tar.gz



RUN useradd -G www-data -d ${GLPI_HOME} glpi \
	&& chown -R www-data:www-data ${GLPI_HOME}

RUN cat /tmp/cron/* | crontab - \
	&& rm -rf /tmp/cron
	
ENV ENTRYPOINT_FILE /usr/local/sbin/entrypoint.sh
COPY entrypoint.sh ${ENTRYPOINT_FILE}
RUN chmod 554 ${ENTRYPOINT_FILE} \
	&& ln -s ${ENTRYPOINT_FILE} /entrypoint.sh


VOLUME /var/www/glpi

EXPOSE 80
CMD ["entrypoint.sh"]
