# Stage 1: Build the frontend
FROM node:18 AS frontend-build

# Set the working directory
WORKDIR /frontend

# Copy frontend package.json and install dependencies
COPY frontend/package*.json ./
RUN npm install

# Copy frontend source code and build it
COPY frontend/ ./
RUN npm run build

# Stage 2: Set up the backend
FROM node:18 AS backend

# Set the working directory
WORKDIR /app

# Copy backend package.json and install dependencies
COPY package.json ./
RUN npm install

# Copy backend source code
COPY backend/ ./

# Copy the built frontend from the previous stage
COPY --from=frontend-build /frontend/dist /app/frontend/dist

# Expose port
EXPOSE 5000

# Run the backend server
CMD ["node", "server.js"]
