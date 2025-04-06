# Use the official Nginx image
FROM nginx:alpine

# Remove the default nginx static files
RUN rm -rf /usr/share/nginx/html/*

# Copy your static site into the container
COPY . /usr/share/nginx/html

# Expose port 8081
EXPOSE 8081

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
