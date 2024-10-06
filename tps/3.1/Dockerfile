# Use the Alpine-based Nginx image version 1.27.2 as the base image
FROM nginx:1.27.2-alpine

# Set an environment variable 'username' with a default value
ENV username="CHANGE_TO_YOUR_NAME"

# Install the gettext package to use the envsubst command
RUN apk add --no-cache gettext

# Set the working directory to /app
WORKDIR /app

# Copy the HTML template file to the working directory
COPY index.html.template /app/index.html.template

# Use envsubst to replace the placeholder in the HTML template with the value of the 'username' environment variable
# and place the resulting HTML file in the default Nginx HTML directory
RUN envsubst '$username' < index.html.template > /usr/share/nginx/html/index.html
