# Use official Nginx image
FROM nginx:alpine

# Copy website files to Nginx web directory
COPY . /usr/share/nginx/html

# Expose port 80 for the web
EXPOSE 80

# Run Nginx
CMD ["nginx", "-g", "daemon off;"]