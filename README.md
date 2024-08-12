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

Labels: Add metadata to the image using LABEL