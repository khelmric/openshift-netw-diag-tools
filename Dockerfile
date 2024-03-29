FROM centos
MAINTAINER Kristof Helmrich <Kristof.Helmrich@t-systems.com>

RUN yum -y install epel-release && yum clean all
RUN yum -y install iperf && yum clean all
RUN yum -y install httpd-tools && yum clean all
RUN yum -y install mtr && yum clean all

ADD loadtest.tar.gz /

EXPOSE 8080

COPY index.html /var/run/web/index.html

CMD cd /var/run/web && python -m SimpleHTTPServer 8080
