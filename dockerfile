# Use an official Ubuntu as a base image
FROM ubuntu:22.04

# Install Node.js, MySQL, and other dependencies
RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    lsb-release \
    build-essential \
    default-mysql-server \
    default-mysql-client \
    git \
    && rm -rf /var/lib/apt/lists/*

# Install Node.js (example with Node.js 20)
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs

# Set the working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the application code
COPY . /app

# Expose the port your app runs on
EXPOSE 8080

# Start the application
CMD ["npm", "start"]
