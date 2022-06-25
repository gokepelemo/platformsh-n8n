#!/usr/bin/env sh
set -e
npm update -g n8n
git add package.json package-lock.json
git commit -am "Automated update of n8n using npm"

