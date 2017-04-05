FROM selenium/standalone-firefox-debug
MAINTAINER albert alvarez

EXPOSE 7000 5000
COPY extensions/ /home

RUN wget -O /usr/local/sbin/install-mozilla-addon http://bernaerts.dyndns.org/download/ubuntu/install-mozilla-addon
RUN chmod +x /usr/local/sbin/install-mozilla-addon
RUN install-mozilla-addon https://addons.mozilla.org/firefox/downloads/latest/foxyproxy-standard/addon-2464-latest.xpi

#RUN sed -i 's/wait $NODE_PID/firefox -silent -install-global-extension \/home\/foxyproxy.xpi \&\& wait $NODE_PID/g' /opt/bin/entry_point.sh

##CMD ["firefox","-silent","-install-global-extension selenium-expert_selenium-ide@Samit.Badle.xpi","-setDefaultBrowser","www.google.es"]
