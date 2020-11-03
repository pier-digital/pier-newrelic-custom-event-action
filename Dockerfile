FROM alpine:3.12

RUN apk add --no-cache curl jq

COPY ./scripts/entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
