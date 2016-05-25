#!/bin/bash

set -e
# Add local user
# Either use the LOCAL_USER_ID if passed in at runtime or
# fallback

USER_ID=${LOCAL_USER_ID:-9001}

echo "Starting with UID : $USER_ID"
addgroup -g $USER_ID user
adduser -u $USER_ID -s /bin/bash -G user -g '' -D user
export HOME=/home/user
exec /sbin/su-exec user git-webhook-proxy "$@"
