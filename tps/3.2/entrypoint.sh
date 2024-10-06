#!/bin/sh
# Substitute the environment variable in the template file
envsubst '$username' < /app/index.html.template > /usr/share/nginx/html/index.html

# Manual message bu the author
echo "This is a manual message by {CHANGE_ME_AUTHOR_NAME}"

# Execute the command provided as arguments to the script
exec "$@"