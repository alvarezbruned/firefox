FROM debian:sid
MAINTAINER albert alvarez

RUN apt-get update && apt-get install -y \
	dirmngr \
	gnupg \
	--no-install-recommends \
	&& apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0AB215679C571D1C8325275B9BDB3D89CE49EC21 \
	&& echo "deb http://ppa.launchpad.net/mozillateam/firefox-next/ubuntu wily main" >> /etc/apt/sources.list.d/firefox.list \
	&& apt-get update && apt-get install -y \
  && apt-get install wget -y \
  && mkdir /usr/lib/selenium \
  && wget http://selenium-release.storage.googleapis.com/2.43/selenium-server-standalone-2.43.1.jar \
  && mv selenium-server-standalone-2.43.1.jar /usr/lib/selenium \
  && ln -s /usr/lib/selenium/selenium-server-standalone-2.43.1.jar /usr/lib/selenium/selenium-server-standalone.jar \
  && mkdir -p /var/log/selenium \
  && chmod a+w /var/log/selenium \ 
	ca-certificates \
	firefox \
	hicolor-icon-theme \
	libasound2 \
	libgl1-mesa-dri \
	libgl1-mesa-glx \
	--no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*
COPY selenium /etc/init.d/selenium
RUN chmod 755 /etc/init.d/selenium \
&& update-rc.d selenium defaults

ENV LANG en-US

COPY local.conf /etc/fonts/local.conf

ENTRYPOINT [ "/usr/bin/firefox" ]
