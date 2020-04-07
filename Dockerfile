FROM alpine

RUN cd /tmp && \
    wget -O caddy.tar.gz "https://caddyserver.com/download/linux/amd64?plugins=http.proxyprotocol,http.webdav&license=personal&telemetry=off" && \
    tar zxvf caddy.tar.gz && \
    mv caddy /bin/ && \
    rm -rf /tmp/* && \
    mkdir -p /caddy/html && \
    echo 'ok' > /caddy/html/index.html

COPY Caddyfile /caddy/Caddyfile

VOLUME /caddy

WORKDIR /caddy

ENV CADDYPATH=/caddy
ENV ACME_AGREE="false"

EXPOSE 80 443

ENTRYPOINT ["/bin/caddy"]
CMD ["--conf", "/caddy/Caddyfile", "--agree=$ACME_AGREE"]
