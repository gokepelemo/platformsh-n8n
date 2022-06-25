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
- The /metrics endpoint is disabled by default, but it's possible to enable it using the `N8N_METRICS` environment variable on `.environment` before deploying.

### Updates
You can update n8n locally with the npm command `npm update -g n8n`, committing the changes, and pushing to Platform.sh. You can update in place using our Source Operations feature with this Platform.sh CLI command:

`platform source-operation:run update-n8n`

### Install a specific n8n version
You can install a specific version of n8n using Source Operations with this command:

`platform source-operation:run install-n8n-version --variable env:N8N_VERSION={n8n version}`

### Revert to the last commit
You can revert to the last commit if your node install or update is not successful with this Platform.sh CLI command:

`platform source-operation:run revert-commit`

Documentation: [Platform.sh](https://docs.platform.sh/) | [n8n](https://docs.n8n.io/)

Github: [Platform.sh](https://github.com/platformsh/) | [n8n](https://github.com/n8n-io/)
