FROM ubuntu:14.04

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		aptitude \
		vim \
	&& rm -rf /var/lib/apt/lists/*

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		apache2 \
		php5 \
		php5-gd \
		php5-mysql \
		wget \
	&& rm -rf /var/lib/apt/lists/*

ENV GLPI_VERSION 0.90.5

RUN wget --no-check-certificate --progress=bar:force https://github.com/glpi-project/glpi/releases/download/${GLPI_VERSION}/glpi-${GLPI_VERSION}.tar.gz \
	&& tar -C /var/www -xvzf glpi-${GLPI_VERSION}.tar.gz \
	&& rm -f glpi-${GLPI_VERSION}.tar.gz

COPY 000-default.conf /etc/apache2/sites-available

ENV ENTRYPOINT_FILE /usr/local/sbin/entrypoint.sh
COPY entrypoint.sh ${ENTRYPOINT_FILE}
RUN ln -s ${ENTRYPOINT_FILE} /entrypoint.sh

EXPOSE 80
CMD ["entrypoint.sh"]
