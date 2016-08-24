FROM ubuntu:16.04

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		aptitude \
		vim \
	&& rm -rf /var/lib/apt/lists/*

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		apache2 \
		php5 \
		php5-gd
		php5-mysql \
		wget \
	&& rm -rf /var/lib/apt/lists/*

ENV GLPI_VERSION 0.90.5

RUN wget --progress=bar:force https://github.com/glpi-project/glpi/releases/download/${GLPI_VERSION}/glpi-${GLPI_VERSION}.tar.gz

ENV ENTRYPOINT_FILE /usr/local/sbin/entrypoint.sh

EXPOSE 80
CMD ["bash"]
