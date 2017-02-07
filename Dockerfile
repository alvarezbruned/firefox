
FROM jess/firefox
MAINTAINER albert alvarez
RUN apt-get install wget -y
RUN wget https://addons.mozilla.org/firefox/downloads/latest/selenium-ide/addon-2079-latest.xpi
RUN firefox -silent -install-global-extension addon-2079-latest.xpi -setDefaultBrowser www.google.es
