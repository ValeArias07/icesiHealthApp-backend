FROM node:20

RUN apt update

# Install bash
RUN apt install bash

# Download and install git
RUN apt install git

# Set workdir
WORKDIR /usr

# Clone repo
RUN git clone https://github.com/ValeArias07/icesiHealthApp-backend

# Set workdir
WORKDIR /usr/icesiHealthApp-backend/

# Add env vars
ARG PORT
ENV ENV_PORT $PORT
ENV USER admin
ENV PASSWORD password
ENV COUCHDB_DIR icesihealth-couch-db.ashybush-0bba524f.eastus.azurecontainerapps.io
ENV DATABASE_URL https://$USER:$PASSWORD@$COUCHDB_DIR

# Expose port
EXPOSE $ENV_PORT

# Update npm version and install dependencies
RUN npm install -g npm@8.5.1

# Install dependencies
RUN npm install --include=dev

# Remove node_modules
RUN rm -rf node_modules

# Install express and cors
RUN npm install express@4.18.2
RUN npm install cors@2.8.5

RUN npm build

# Entrypoint
# CMD ["node", "app.js"]
CMD ["npm", "start"]
