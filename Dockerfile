FROM nginx:alpine

# Copy the app and its bundled editor library to nginx html directory
COPY index.html /usr/share/nginx/html/index.html
COPY vendor/ /usr/share/nginx/html/vendor/

# Expose port 80
EXPOSE 80

# Nginx will start automatically when container runs
CMD ["nginx", "-g", "daemon off;"]
