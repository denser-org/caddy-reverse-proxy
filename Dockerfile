# FROM caddy:latest

# WORKDIR /app

# COPY Caddyfile ./

# COPY --chmod=755 entrypoint.sh ./

# RUN caddy fmt --overwrite Caddyfile

# ENTRYPOINT ["/bin/sh"]

# CMD ["entrypoint.sh"]

FROM nginx:latest

COPY denser.conf /etc/nginx/conf.d/denser.conf
