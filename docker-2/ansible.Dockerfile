FROM sbeliakou/centos:7.2
RUN yum install -y epel-release yum-plugin-ovl python2-pip gcc libffi-devel python-devel openssl-devel
RUN pip install ansible==2.2.1
RUN pip install --upgrade pip
