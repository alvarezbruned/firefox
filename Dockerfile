FROM selenium/standalone-firefox-debug
MAINTAINER albert alvarez

EXPOSE 7000 5000
COPY extensions/ /home
RUN sed -i 's/wait $NODE_PID/firefox -silent -install-global-extension \/home\/addon-2079-latest.xpi \&\& wait $NODE_PID/g' /opt/bin/entry_point.sh

##CMD ["firefox","-silent","-install-global-extension selenium-expert_selenium-ide@Samit.Badle.xpi","-setDefaultBrowser","www.google.es"]
