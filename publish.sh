#!/bin/bash
set -e -u -o pipefail
trap "kill 0" SIGINT SIGTERM

npm run release
aws s3 sync build s3://seanmcl-website/build
aws s3 sync public/content s3://seanmcl-website/content
aws s3 cp public/prod.html s3://seanmcl-website/index.html
