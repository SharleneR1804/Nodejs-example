# Use the official Node.js image as a base
FROM node:alpine

# Create and set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of your app's source code to the container
COPY . .

# Expose the port your app runs on
EXPOSE 8080

# Command to start your app
CMD ["npm", "start"]