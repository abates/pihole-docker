# pihole-docker

This docker image is based on the official PiHole docker image.  The difference
is that this image starts a second dnsmasq instance and sets pihole's upstream
servers to the second dnsmasq instance.  This allows more fine-grained control
over locally served DNS records.

The original motivation for this image was the need to be able to set a
local-ttl higher than 2 (the PiHole default).  With the configuration in this
image, PiHole maintains its TTL of 2 (for blacklisted records) and forwards all
requests to the upstream dnsmasq server.  That dnsmasq server is configured
however you like.

### Usage

In order to use this image, dnsmasq configs must be provided using a bind mount
to /etc/upstream.d.  Here is an example:

```shell
docker run --rm --volume=$(pwd)/upstream.d:/etc/upstream.d abates314/pihole
```

### Upstream DNS

All of the PiHole docker environment variables are supported.  Do not change the 
DNS settings in the PiHole admin console.  This setting is overwritten every time 
the docker image boots.  To set upstream DNS servers either use the DNS1 and DNS2
environment variables, or use the PIHOLE_DNS_ environment variable:

```
docker run --rm -e DNS1=208.67.222.123 -e DNS2=208.67.220.123 abates314/pihole
```

or

```
docker run --rm -e "PIHOLE_DNS_=208.67.222.123;208.67.220.123" abates314/pihole
```

