FROM nginx:alpine

# Copy index.html to nginx html directory
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80
EXPOSE 80

# Nginx will start automatically when container runs
CMD ["nginx", "-g", "daemon off;"]
