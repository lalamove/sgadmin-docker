FROM openjdk:8-jre-alpine as builder

WORKDIR /root/
RUN apk add --no-cache wget ca-certificates openssl unzip bash
RUN wget https://oss.sonatype.org/content/repositories/releases/com/floragunn/search-guard-6/6.0.0-17.beta1/search-guard-6-6.0.0-17.beta1-sgadmin-standalone.zip
RUN unzip search-guard-6-6.0.0-17.beta1-sgadmin-standalone.zip -d sgadmin/

FROM openjdk:8-jre-alpine
RUN apk add --no-cache bash
COPY --from=builder /root/sgadmin /root/
ENTRYPOINT [ "/root/tools/sgadmin.sh" ]
