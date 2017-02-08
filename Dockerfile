FROM debian:sid
MAINTAINER albert alvarez

RUN apt-get update && apt-get install -y \
	dirmngr \
	gnupg \
	--no-install-recommends \
	&& apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0AB215679C571D1C8325275B9BDB3D89CE49EC21 \
	&& echo "deb http://ppa.launchpad.net/mozillateam/firefox-next/ubuntu wily main" >> /etc/apt/sources.list.d/firefox.list \
	&& apt-get update && apt-get install -y \
	ca-certificates \
	firefox \
	hicolor-icon-theme \
	libasound2 \
	libgl1-mesa-dri \
	libgl1-mesa-glx \
	--no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

ENV LANG en-US

COPY local.conf /etc/fonts/local.conf

CMD [ "/usr/bin/firefox" ]


#RUN mkdir -p /usr/lib/mozilla-firefox/extensions


ADD selenium-expert_selenium-ide@Samit.Badle.xpi .
ADD selenium_ide_buttons@egarracingteam.com.ar.xpi .
CMD ["firefox","-silent","-install-global-extension selenium_ide_buttons@egarracingteam.com.ar.xpi","-setDefaultBrowser","www.google.es"]
ENTRYPOINT ["firefox","-silent","-install-global-extension selenium-expert_selenium-ide@Samit.Badle.xpi","-setDefaultBrowser","www.google.es"]
