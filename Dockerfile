# Use a smaller base image for the build stage
FROM node:18-alpine as build

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Build the Vue app for production
RUN npm run build

# Use a smaller base image for the production stage
FROM nginx:alpine

# Copy the built Vue app from the build stage to the NGINX server
COPY --from=build /app/dist /usr/share/nginx/html

# Expose port 80
EXPOSE 80
