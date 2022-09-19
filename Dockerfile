FROM tomcat:9

RUN apt update && \
    apt install -y maven && \
    apt install -y git && \
    apt install -y default-jdk && \
    mkdir -p ./build

WORKDIR /build

RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git && \
    mvn package -f boxfuse-sample-java-war-hello/pom.xml && \
    mv boxfuse-sample-java-war-hello/target/hello-1.0.war /var/lib/tomcat9/webapps/hello.war

EXPOSE 8080