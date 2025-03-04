# Use official Node.js LTS image
FROM node:20-alpine AS base

# Set working directory
WORKDIR /app

# Install dependencies
COPY package.json package-lock.json ./
RUN npm ci

# Copy project files
COPY . .

# Build the application
RUN npm run build

# Expose port and start application
EXPOSE 3000
CMD ["npm", "start"]