FROM ubuntu:bionic
MAINTAINER albert alvarez

EXPOSE 4444

RUN apt-get update
RUN apt-get install -y firefox
ADD https://github.com/mozilla/geckodriver/releases/download/v0.24.0/geckodriver-v0.24.0-linux64.tar.gz /usr/local/bin/geckodriver-v0.24.0-linux64.tar.gz
WORKDIR /usr/local/bin
RUN tar -xvzf /usr/local/bin/geckodriver-v0.24.0-linux64.tar.gz
WORKDIR /root
RUN ls -lsa /usr/local/bin
RUN rm /usr/local/bin/geckodriver-v0.24.0-linux64.tar.gz

RUN ls -l /usr/lib/firefox

RUN mkdir -pv /home/appuser

RUN groupadd -g 999 appuser && \
    useradd -r -u 999 -g appuser appuser

RUN chown appuser:appuser /home/appuser

WORKDIR /home/appuser
USER appuser

RUN export PATH=$PATH:/usr/local/bin/geckodriver


ENTRYPOINT /usr/lib/firefox/firefox.sh



