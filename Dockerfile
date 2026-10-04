FROM alpine:latest

ARG PB_VERSION=0.21.3

RUN apk add --no-cache \
    unzip \
    ca-certificates

# PocketBase indir
ADD https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip /tmp/pb.zip
RUN unzip /tmp/pb.zip -d /pb/

EXPOSE 8080

# PocketBase'i Render portuna bağlayarak başlat
CMD ["/pb/pocketbase", "serve", "--http=0.0.0.0:8080"]
