# n8n workflow automation

This repository contains a working configuration of n8n that can be deployed on Platform.sh and used for workflow automations. It is 
configured with:
- A persistent redis service to run your queues
- A worker container to free up the main process while workflows are executing
- A publicly available `/files` path to serve n8n processed files publicly e.g. output > `files/{filename}.pdf` on n8n
- A cache directory `.cache` to store files that are still being used in your workflows, or that are shared between workflows

## Installation
An encryption key is needed on the project to store integration credentials safely between environments. You can create one with the [Platform.sh CLI](https://docs.platform.sh/gettingstarted/introduction/own-code/cli-install.html) and this command before your first deploy:

`platform variable:create -y --level project --sensitive true --name env:N8N_ENCRYPTION_KEY --value $(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 30) --visible-build true --visible-runtime true`

### .environment
- By default, HTTP basic auth is enabled and configured as n8n:n8n. You can modify that on `.environment` before deploying.
- The /metrics endpoint is disabled by default, but it's possible to enable it using the N8N_METRICS environment variable on `.environment` before deploying.

Read all about [Platform.sh](https://docs.platform.sh/) and [n8n](https://docs.n8n.io/).

[n8n v0.183](https://github.com/n8n-io/n8n)
