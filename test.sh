#!/bin/bash

docker run --rm -p 80:80 -p 443:443 --volume=$(pwd)/test.d:/etc/upstream.d --volume=$(pwd)/test:/etc/upstream abates314/pihole

