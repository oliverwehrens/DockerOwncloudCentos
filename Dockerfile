FROM centos

RUN yum install -y wget

RUN wget http://dl.fedoraproject.org/pub/epel/7/x86_64/epel-release-7-1.noarch.rpm
RUN rpm -ivh ./epel-release-7-1.noarch.rpm
RUN wget http://download.opensuse.org/repositories/isv:ownCloud:community/CentOS_CentOS-6/isv:ownCloud:community.repo -O /etc/yum.repos.d/isv:ownCloud:community.repo
RUN rm ./epel-release-7-1.noarch.rpm

RUN yum -y update
RUN yum install -y owncloud
RUN mkdir -p /var/www/html/owncloud/data
RUN chown -R apache:apache /var/www/html/owncloud

RUN yum clean all

VOLUME ["/var/www/html/owncloud/data"]
EXPOSE 80

ENTRYPOINT ["/usr/sbin/httpd"]

CMD ["-D", "FOREGROUND"]
