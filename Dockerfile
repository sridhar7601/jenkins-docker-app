# Use an official Node.js runtime as a parent image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package.json ./
RUN npm install

# Copy app files
COPY . .

# Expose the port (same as in app.js)
EXPOSE 3000

# Start the app
CMD ["npm", "start"]
