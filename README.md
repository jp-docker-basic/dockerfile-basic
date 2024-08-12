# Dockerfile cmd

[CMD command](./doc/cmd/cmd.md)

[ENTRYPOINT command](./doc/entrypoint/entypoint.md)

## A Standard Dockerfile Example: Node.js Application

**Understanding the Components**

A `Dockerfile` is a text document that contains all the commands a user could call on the command line to assemble an image.

```Dockerfile
# Use a lightweight Node.js image as the base
FROM node:alpine

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install  
 dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the port the app will run on
EXPOSE  
 3000

# Command to run when the container starts
CMD ["node", "index.js"]
```

## Explanation of Instructions:

- `FROM`: Specifies the base image to use.
- `WORKDIR`: Sets the working directory inside the container.
- `COPY`: Copies files from the host to the container.
- `RUN`: Executes commands in the container.
- `EXPOSE`: Indicates which port the container will listen on.
- `CMD`: Sets the default command to run when the container starts.

## Additional Considerations:

`Multi-stage builds`: For optimized image size, consider using multi-stage builds to separate build and runtime environments.

`Environment variables`: Use ENV to set environment variables within the container.

`User`: Specify the user to run the application with using USER.

`Healthchecks`: Define health checks to monitor the container's health.

`Labels`: Add metadata to the image using LABEL

## Example with Multi-stage Build:

```Dockerfile
# Build stage
FROM node:16-alpine AS build
WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

# Production stage
FROM node:16-alpine  

WORKDIR /app

COPY --from=build /app/build .

EXPOSE 3000

CMD ["node", "index.js"]
```
This example builds the application in one stage and copies only the production-ready assets to the final image, reducing its size.

### Remember:

- Always tailor the Dockerfile to your specific application requirements.
- Consider using a .dockerignore file to exclude unnecessary files from the build context.
- Test your Docker image thoroughly to ensure it works as expected.