#!/bin/sh

# This script is used by GitHub Action to check if there is any update for "ggerganov/llama.cpp". If so, it returns with 0.
# Required environment variables:
# 1. LOCAL_REPO:     The name of this repo.
# 2. REMOTE_REPO:   The name of the remote repo.

if [ -z $LOCAL_REPO ] || [ -z $REMOTE_REPO ]; then 
    echo 'Error: LOCAL_REPO or REMOTE_REPO is undefined.' 1>&2
    exit 1
fi

LOCAL_TAG=`curl -fsSL "https://api.github.com/repos/$LOCAL_REPO/branches/master" | jq -r '.tag_name'`
REMOTE_TAG=`curl -fsSL "https://api.github.com/repos/$REMOTE_REPO/branches/master" | jq -r '.tag_name'`
if [ "$LOCAL_TAG" = "$REMOTE_TAG" ]; then
    exit 1
else
    echo "{LLAMA_CPP_VERSION}={$REMOTE_TAG}" >> $GITHUB_ENV
    exit
fi