FROM selenium/standalone-firefox-debug
MAINTAINER albert alvarez

EXPOSE 7000 5000
COPY extensions/ /home

#ADD selenium-expert_selenium-ide@Samit.Badle.xpi .
#ADD selenium_ide_buttons@egarracingteam.com.ar.xpi .

#firefox -silent -install-global-extension addon-1865-latest.xpi -setDefaultBrowser www.google.es
RUN sed -i 's/wait $NODE_PID/firefox -silent -install-global-extension /home/extensions/addon-2079-latest.xpi -setDefaultBrowser www.google.es wait $NODE_PID/g' /opt/bin/entry_point.sh

##CMD ["firefox","-silent","-install-global-extension selenium-expert_selenium-ide@Samit.Badle.xpi","-setDefaultBrowser","www.google.es"]
