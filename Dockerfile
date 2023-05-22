FROM node:20

RUN apt update

# Install bash
RUN apt install bash

# Download and install git
RUN apt install git

# Set workdir
WORKDIR /usr

# Add env vars
ARG PORT
ARG REPOSITORY
ARG USER
ARG PASSWORD
ARG COUCHDB_DIR

ENV ENV_PORT $PORT
ENV ENV_REPOSITORY $REPOSITORY
ENV ENV_USER $USER
ENV ENV_PASSWORD $PASSWORD
ENV ENV_COUCHDB_DIR $COUCHDB_DIR
ENV DATABASE_URL https://$ENV_USER:$ENV_PASSWORD@$ENV_COUCHDB_DIR

# Clone repo
RUN git clone $ENV_REPOSITORY

# Set workdir
WORKDIR /usr/icesiHealthApp-backend/

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
