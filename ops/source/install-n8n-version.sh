#!/usr/bin/env sh
set -e
npm install n8n@$N8N_VERSION
git add package.json package-lock.json
git commit -am "Automated update of n8n to v$N8N_VERSION via npm"

