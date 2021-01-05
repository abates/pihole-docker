FROM pihole/pihole:latest
ARG BUILDPLATFORM
ARG TARGETARCH

RUN apt update && \
    apt install -y -o Dpkg::Options::="--force-confold" dnsmasq

COPY root/ /

VOLUME ["/etc/upstream"]
VOLUME ["/etc/upstream.d"]

ENTRYPOINT ["/init"]
