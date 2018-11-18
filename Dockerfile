FROM openjdk:8-jdk-alpine

MAINTAINER qinchy <qinchy@msn.com>
	
RUN mkdir /home/git; \
    cd /home/git; \
    sudo git clone https://github.com/qinchy/jibdemo.git -b master; \
    cd jibdemo; \
    mvn clean package -Dmaven.test.skip=true -Dfile.encoding=UTF-8 -DsendCredentialsOverHttp=true 
	
VOLUME /tmp

ADD /home/git/jibdemo/target/jibdemo-0.0.1-SNAPSHOT.jar app.jar

RUN bash -c 'touch /app.jar'

EXPOSE 8080

ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]