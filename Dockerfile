
FROM jess/firefox
MAINTAINER albert alvarez

RUN wget https://addons.mozilla.org/firefox/downloads/latest/selenium-ide/addon-2079-latest.xpi
firefox -silent -install-global-extension addon-2079-latest.xpi -setDefaultBrowser www.google.es
