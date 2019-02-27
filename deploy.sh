#!/bin/bash
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
pushd "$BASEDIR" >> /dev/null
jekyll build
s3_website push
