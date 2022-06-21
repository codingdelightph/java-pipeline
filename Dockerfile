FROM maven:3-jdk-8 

RUN apk update \
 && apk add --no-cache curl jq \
 && rm -rf /var/cache/apk/*

COPY target/hello.jar /app/

ENTRYPOINT ["java", "-jar", "/app/hello.jar"]

