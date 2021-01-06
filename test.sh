#!/bin/bash

docker run --name pihole --rm -p 80:80 -p 443:443 -e "PIHOLE_DNS_=208.67.222.123;208.67.220.123" --volume=$(pwd)/test.d:/etc/upstream.d --volume=$(pwd)/test/static_hosts:/etc/static_hosts abates314/pihole

