FROM nginx:alpine

# Copy the config over to container
COPY config/nginx.conf /etc/nginx/nginx.conf

# Copy the pre-generated keys to container
COPY key/cert.pem /etc/ssl/certs/
COPY key/key.pem /etc/ssl/private/