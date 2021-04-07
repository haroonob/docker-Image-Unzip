#FROM exam-image
#FROM quay.io/cprakash2118/java-unzip-httpd-image
FROM localhost/java-unzip-httpd-image-02
MAINTAINER Chandra Prakash < cprakash@qcsdclabs.com >
LABEL description="EX180 exam setup"

#RUN mkdir -p /opt/jboss
RUN mkdir -p /opt/jboss7
COPY jboss7.2.zip /opt/jboss7/jboss7.2.zip 
#RUN unzip /opt/jboss7/jboss7.2.zip
RUN unzip /opt/jboss7/jboss7.2.zip -d /opt/jboss7/
RUN rm -rf /opt/jboss7/jboss7.2.zip

RUN chown -R jboss:jboss /opt/jboss7  && \
    chmod -R 755 /opt/jboss7

#CMD ["/opt/jboss/jboss-7.2/useradd.sh admin redhat123!"]
#CMD ["/opt/jboss7/jboss7.2/bin/add-user.sh -u chandra redhat"]
CMD ["/opt/jboss7/jboss7-eap/bin/add-user.sh -u chandra redhat"]

ENV JBOSS_HOME /opt/jboss7/jboss7-eap
#USER jboss
#USER jboss
USER root

EXPOSE 80 8080 9990 9999
#CMD ["JBOSS_HOME/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "bmanagement", "0.0.0.0"]
#CMD ["httpd","-D","FOREGROUND"]
#CMD ["${JBOSS_HOME}/bin/standalone.sh","-D","FOREGROUND"]
#CMD nohup ${JBOSS_HOME}/bin/standalone.sh & 
CMD ["/opt/jboss7/jboss7-eap/bin/standalone.sh", "-b", "0.0.0.0"]
