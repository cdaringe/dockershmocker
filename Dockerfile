FROM alpine as builder
RUN mkdir -p /app
COPY package.json /app
RUN apk update && apk add nodejs # not in alpine
RUN echo "build reports! use secrets!"
COPY src /app

FROM alpine:latest
WORKDIR /app
COPY --from=builder /lib/ /lib/
COPY --from=builder /etc/ /etc/
COPY --from=builder /usr/ /usr/
COPY src /app/src
CMD ["node", "src/index.js"]
