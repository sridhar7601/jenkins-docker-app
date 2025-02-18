    # Use official Node.js image
FROM node:18

# Set working directory
WORKDIR /app

# Copy package files & install dependencies
COPY package*.json ./
RUN npm install

# Copy application files
COPY . .

# Expose port
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
