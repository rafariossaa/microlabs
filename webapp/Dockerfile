FROM docker.io/bitnami/node:22

# Copy the app
COPY app/ /app

WORKDIR /app
# Install depencencies (express)
RUN npm install

# Port to be exposed in the container
EXPOSE 3000

# Run the app
CMD node app.js