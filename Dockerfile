FROM centos:7

ARG IPFS_VERSION=v0.4.17

RUN curl -o "go-ipfs_${IPFS_VERSION}.tar.gz" "https://dist.ipfs.io/go-ipfs/${IPFS_VERSION}/go-ipfs_${IPFS_VERSION}_linux-amd64.tar.gz" && \
    tar xvzf "go-ipfs_${IPFS_VERSION}.tar.gz" && \
    cp go-ipfs/ipfs /usr/bin/ipfs && \
    rm -rf go-ipfs go-ipfs_${IPFS_VERSION}.tar.gz && \
    useradd -r -m -d /var/lib/ipfs ipfs

ADD assets/entrypoint.sh /entrypoint.sh

USER ipfs
WORKDIR /var/lib/ipfs

ENV IPFS_PATH=/var/lib/ipfs/.ipfs

EXPOSE 4001 4002/udp 5001 8080 8081

VOLUME ["/var/lib/ipfs"]

ENTRYPOINT ["/entrypoint.sh"]
CMD ["ipfs", "daemon"]
