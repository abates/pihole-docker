#!/bin/bash

docker run --rm -p 80:80 -p 443:443 --volume=$(pwd)/test.d:/etc/upstream.d --volume=$(pwd)/test/static_hosts:/etc/static_hosts abates314/pihole

