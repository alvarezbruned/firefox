
FROM jess/firefox
MAINTAINER albert alvarez
ADD selenium-expert_selenium-ide@Samit.Badle.xpi .
ADD selenium_ide_buttons@egarracingteam.com.ar.xpi .
CMD ["firefox","-silent","-install-global-extension selenium-expert_selenium-ide@Samit.Badle.xpi","-setDefaultBrowser","www.google.es"]
