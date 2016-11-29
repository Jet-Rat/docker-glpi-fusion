FROM ubuntu:14.04


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
		php5 \
		php5-curl \
		php5-gd \
		php5-imap \
		php5-ldap \
		php5-mysql \
		wget \
	&& php5enmod imap \
	&& rm -rf /var/lib/apt/lists/*


ENV a 1
COPY 000-default.conf /etc/apache2/sites-available


RUN useradd -G www-data -d ${GLPI_HOME} glpi \
	&& chown -R www-data:www-data ${GLPI_HOME}


ENV ENTRYPOINT_FILE /usr/local/sbin/entrypoint.sh
COPY entrypoint.sh ${ENTRYPOINT_FILE}
RUN chmod 554 ${ENTRYPOINT_FILE} \
	&& ln -s ${ENTRYPOINT_FILE} /entrypoint.sh


EXPOSE 80
CMD ["entrypoint.sh"]
