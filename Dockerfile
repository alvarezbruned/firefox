FROM selenium/standalone-firefox-debug
MAINTAINER albert alvarez

EXPOSE 7000 5000


RUN mkdir /root/extensions

RUN mkdir -p /usr
RUN mkdir -p /usr/share
RUN mkdir -p /usr/share/mozilla
RUN mkdir -p /usr/share/mozilla/extensions
RUN mkdir -p /usr/share/mozilla/extensions/foxyproxy


ADD https://addons.mozilla.org/firefox/downloads/latest/foxyproxy-standard/addon-2464-latest.xpi /home/seluser

RUN unzip /home/seluser/addon-2464-latest.xpi

RUN cp /home/seluser/addon-2464-latest.xpi /usr/share/mozilla/extensions/foxyproxy

#RUN cp /usr/share/mozilla/extensions/foxyproxy/install.rdf /

RUN mv /usr/share/mozilla/extensions/foxyproxy /usr/share/mozilla/extensions/foxyproxy/$(cat /install.rdf | grep '<em:id>' | grep '{' | head -n1 | sed 's/\s//g' | sed 's/<em\:id>//g' |  sed 's/<\/em\:id>//g')









#RUN sed -i 's/wait $NODE_PID/firefox -silent -install-global-extension \/home\/foxyproxy.xpi \&\& wait $NODE_PID/g' /opt/bin/entry_point.sh

##CMD ["firefox","-silent","-install-global-extension selenium-expert_selenium-ide@Samit.Badle.xpi","-setDefaultBrowser","www.google.es"]
