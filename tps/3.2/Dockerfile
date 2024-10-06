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


########################
# NEW CONFIGURATION
########################

# Copy the entrypoint script to the working directory
COPY entrypoint.sh /app/entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /app/entrypoint.sh

# Set the entrypoint to the script
ENTRYPOINT ["/app/entrypoint.sh"]

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]