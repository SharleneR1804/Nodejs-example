# Use the official Node.js image as a base
FROM node:22-alpine

# Create and set the working directory inside the container
WORKDIR /app

# Install system dependencies (if any)
RUN apk add --no-cache git curl

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install Node.js dependencies
RUN npm install --production

# Copy the rest of your app's source code to the container
COPY . .

# Expose the port your app runs on
EXPOSE 8080

# Command to start your app
CMD ["npm", "start"]