FROM alpine:3.20.3 AS builder

LABEL maintainer="Bored Mates Crypto Club <info@boredmates.com>"
LABEL org.opencontainers.image.source="https://github.com/boredmates/moneroocean-xmrig-docker"
LABEL org.opencontainers.image.description="MoneroOcean's version of XMRig cryptocurrency miner on Docker and Kubernetes with possibility of dynamic coin switching"
LABEL org.opencontainers.image.licenses="MIT"

RUN apk --no-cache add git make cmake libstdc++ gcc g++ libuv-dev openssl-dev

RUN echo 'https://dl-cdn.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories; \
    apk --no-cache add hwloc-dev; \
    mkdir /xmrig

WORKDIR /xmrig

RUN git clone --depth 1 https://github.com/MoneroOcean/xmrig ./; \
    cmake -DCMAKE_BUILD_TYPE=Release .; \
    make -j$(nproc)

FROM alpine:3.20.3

COPY --from=builder /xmrig/xmrig /bin/
COPY default_config.json /bin/default_config.json

RUN apk --no-cache add libuv-dev

RUN echo 'https://dl-cdn.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories; \
    echo 'https://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories; \
    apk --no-cache add hwloc-dev msr-tools kmod

ENTRYPOINT ["xmrig"]
CMD ["--config=/bin/default_config.json"]