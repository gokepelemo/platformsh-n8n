#!/usr/bin/env sh
set -e
if [ ! -f files/index.html ]; then
  # Create an index.html file in the files directory
  touch files/index.html
  echo "n8n - The workflow automation platform that doesn't box you in, that you never outgrow" >> files/index.html
fi;

