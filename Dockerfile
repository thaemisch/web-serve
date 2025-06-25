FROM node:20-alpine

ENV REPO_URL=""
ENV APP_DIR=/app

WORKDIR $APP_DIR

RUN apk add --no-cache git

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]