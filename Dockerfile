FROM caddy:latest-builder AS builder

RUN xcaddy build --with github.com/lindenlab/caddy-s3-proxy

FROM caddy:latest AS runner

WORKDIR /ap

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

COPY Caddyfile ./

COPY --chmod=755 entrypoint.sh ./

RUN caddy fmt --overwrite Caddyfile

ENTRYPOINT ["/bin/sh"]

CMD ["entrypoint.sh"]
