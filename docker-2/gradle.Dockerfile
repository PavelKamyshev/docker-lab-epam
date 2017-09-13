FROM ubuntu:16.04
MAINTAINER Pavel Kamyshev
RUN apt-get -y update \
    && apt-get -y install wget unzip nano git default-jdk ssh \
    && wget https://services.gradle.org/distributions/gradle-4.1-bin.zip \
    && mkdir /opt/gradle \
    && unzip -d /opt/gradle gradle-4.1-bin.zip
#RUN echo "export PATH=$PATH:/opt/gradle/gradle-4.1/bin" >> /etc/profile
ENV PATH=$PATH:/opt/gradle/gradle-4.1/bin
ENV GRADLE_VERSION 4.1
ENV GRADLE_HOME=/opt/gradle/gradle-4.1
RUN useradd jenkins -m -s /bin/bash
#    && echo "export PATH=$PATH:/opt/gradle/gradle-4.1/bin" >> /home/jenkins/.bashrc \
#    && echo "export PATH=$PATH:/opt/gradle/gradle-4.1/bin" >> /home/jenkins/.profile \
#    && touch /home/jenkins/.bash_profile \
#    && echo "export PATH=$PATH:/opt/gradle/gradle-4.1/bin" >> /home/jenkins/.bash_profile
RUN echo "PATH=\"/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/opt/gradle/gradle-4.1/bin\"" > /etc/environment
RUN mkdir /home/jenkins/.ssh \
    && chmod 700 /home/jenkins/.ssh \
    && touch /home/jenkins/.ssh/authorized_keys \
    && chmod 600 /home/jenkins/.ssh/authorized_keys
COPY id_rsa.pub /home/jenkins/.ssh/
RUN cat /home/jenkins/.ssh/id_rsa.pub >> /home/jenkins/.ssh/authorized_keys
RUN chown -R jenkins:jenkins /home/jenkins/.ssh/
RUN mkdir -p /var/run/sshd \
    && chmod 755 /var/run/sshd
CMD ["/usr/sbin/sshd", "-D"]
