FROM centos:latest

MAINTAINER parshuram.kurma@gmail.com

RUN mkdir /opt/app/tomcat/

WORKDIR /opt/app/tomcat
RUN curl -O https://downloads.apache.org/tomcat/tomcat-10/v10.0.0/bin/apache-tomcat-10.0.0.tar.gz
RUN tar xvfz apache-tomcat-10.0.0.tar.gz
RUN mv apache-tomcat-10.0.0/* /opt/app/tomcat/.
RUN yum -y install java
RUN java -version

WORKDIR /opt/app/tomcat/webapps
RUN curl -O -L https://github.com/AKSarav/SampleWebApp/raw/master/dist/SampleWebApp.war

EXPOSE 8080

CMD ["/opt/app/tomcat/bin/catalina.sh", "run"]
