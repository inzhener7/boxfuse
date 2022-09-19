FROM tomcat:9

RUN apt update && \
    apt install -y maven && \
    apt install -y git && \
    apt install -y default-jdk && \
    mkdir -p ./build

WORKDIR /build

RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git && \
    cd boxfuse-sample-java-war-hello/ && \
    mvn package && \
    cp ./target/hello-1.0.war /var/lib/tomcat9/webapps/

WORKDIR 

EXPOSE 8080