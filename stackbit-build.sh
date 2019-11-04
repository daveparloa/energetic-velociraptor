#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5dbfdfd1bb90dd001bd9929f/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5dbfdfd1bb90dd001bd9929f
curl -s -X POST https://api.stackbit.com/project/5dbfdfd1bb90dd001bd9929f/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5dbfdfd1bb90dd001bd9929f/webhook/build/publish > /dev/null
