FROM ubuntu:16.04

RUN apt-get update && \
  apt-get install -y --no-install-recommends locales && \
  locale-gen en_US.UTF-8 && \
  apt-get dist-upgrade -y && \
  apt-get --purge remove openjdk* && \
  echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections && \
  echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" > /etc/apt/sources.list.d/webupd8team-java-trusty.list && \
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886 && \
  apt-get update && \
  apt-get install -y --no-install-recommends oracle-java8-installer oracle-java8-set-default && \
  apt-get clean all

RUN apt-get install -y oracle-java8-set-default

RUN apt-get -y install curl

COPY /liferay-dxp-7.1.10-ga1/ /opt/lr/

RUN rm -rf /opt/lr/webapps/ROOT/WEB-INF/classes/ehcache/

COPY /cluster/ /opt/lr/

HEALTHCHECK --start-period=3m \
  CMD curl -fsS 'http://localhost:8080/c/portal/layout' || exit 1

WORKDIR /opt/lr/tomcat/bin/

CMD ["./catalina.sh", "run"]
