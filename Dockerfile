FROM alpine

RUN cd /tmp && \
    wget -O caddy.tar.gz "https://github.com/caddyserver/caddy/releases/download/v2.1.1/caddy_2.1.1_linux_amd64.tar.gz" && \
    tar zxvf caddy.tar.gz && \
    mv caddy /bin/ && \
    rm -rf /tmp/* && \
    mkdir -p /caddy/html && \
    echo 'ok' > /caddy/html/index.html

COPY Caddyfile /caddy/Caddyfile

VOLUME /caddy

WORKDIR /caddy

ENV CADDYPATH=/caddy

EXPOSE 80 443

ENTRYPOINT ["/bin/caddy"]

CMD ["run", "--config", "/caddy/Caddyfile", "--adapter", "caddyfile"]
