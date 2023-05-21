FROM node:20

RUN apt update

# Install bash
RUN apt install bash

# Download and install git
RUN apt install git

# Set workdir
WORKDIR /usr

# Add env vars
ENV PORT 
ENV USER 
ENV REPO
ENV PASSWORD 
ENV COUCHDB_DIR 
ENV DATABASE_URL https://$USER:$PASSWORD@$COUCHDB_DIR

# Clone repo
RUN git clone $REPO

# Set workdir
WORKDIR /usr/icesiHealthApp-backend/

# Expose port
EXPOSE $PORT

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
