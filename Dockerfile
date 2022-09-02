FROM alpine:edge

ARG AUUID="347b6570-c199-460e-99b8-3aba82d2805f"
ARG CADDYIndexPage="https://www.free-css.com/assets/files/free-css-templates/download/page26/evergreen.zip"
ARG ParameterSSENCYPT="chacha20-ietf-poly1305"
ARG PORT=8080

ADD etc/Caddyfile /tmp/Caddyfile
ADD etc/xray.json /tmp/xray.json
ADD deploy.sh /deploy.sh
ADD start.sh /start.sh

RUN apk update && \
    apk add --no-cache ca-certificates bash caddy tor unzip wget && \
    bash deploy.sh

RUN chmod +x /start.sh

CMD /start.sh
