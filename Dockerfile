FROM telegraf:latest

RUN echo "deb http://ftp.pl.debian.org/debian/ bookworm main contrib non-free" >> /etc/apt/sources.list && \
	apt-get update &&  apt-get -y install snmp-mibs-downloader && \
	sed -i "s/^\(mibs *:\).*/#\1/" /etc/snmp/snmp.conf

COPY NAS_QTS_4.mib NAS_QTS_5.mib PowerNet457.mib /usr/share/snmp/mibs/