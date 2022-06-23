On this n8n template version, we have another instance 
of n8n in a different application to process your 
webhooks, and in order to have them working together, 
they need to share the same encryption key.

You can create one with the Platform.sh CLI by running:

`platform variable:create -y --level project --sensitive true --name env:N8N_ENCRYPTION_KEY --value $(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 30) --visible-build true --visible-runtime true`
