# Understanding the USER Instruction in Dockerfiles

In Dockerfiles, the `USER` instruction is used to specify the user account that the `Docker` container will run as.
This can be important for security and for managing permissions within the container.

Here's a detailed look at how the USER instruction works and its implications:

**Syntax**

```Dockerfile
USER [username | uid [:group | gid]]
```

- The `username` or `uid` determines the user account under which the container will execute.

- `group` or `gid` specifies the group that the user belongs to. If omitted, the default group for the user will be used.

```dockerfile
# Use an official base image
FROM ubuntu:20.04

# Create a new user and group
RUN groupadd -r mygroup && useradd -r -g mygroup myuser

# Switch to the new user
USER myuser:mygroup

# Add the rest of your Dockerfile instructions
COPY . /app
WORKDIR /app
RUN make /app
CMD ["./myapp"]
```

### Explanation

#### 1. Creating a User and Group:

In the example, groupadd and useradd are used to create a new group and user within the container.

#### 2. Switching User:

USER myuser:mygroup changes the user to myuser and the group to mygroup. This means that any subsequent instructions in the Dockerfile and the running application will execute as this user.

## Key Points

### 1. Security:

Running processes as a `non-root` user is a security best practice. This minimizes the risk of privilege escalation and potential security vulnerabilities.

### 2. File Permissions:

Ensure that the files and directories used by your application have appropriate permissions for the specified user. If the `USER` instruction is set but the files are owned by root or another user, you may run into permission issues.

### 3. Effect on Instructions:

The USER instruction affects all subsequent instructions in the Dockerfile. For example, `RUN`, `CMD`, and `ENTRYPOINT` will all be executed as the specified `user`.

### 4. Default User:

If you don't specify a USER, Docker containers typically run as the `root user` by default.

### 5.Switching Back to Root:

You can use another `USER` instruction to switch back to root or to a different user later in the Dockerfile if needed.

## Practical Example

```Dockerfile
FROM node:14

# Create a non-root user
RUN useradd -ms /bin/sh appuser

# Set the user for the following instructions
USER appuser

# Copy application code and install dependencies
WORKDIR /home/appuser/app
COPY --chown=appuser:appuser . .

# Install dependencies and build
RUN npm install
RUN npm run build

# Command to run the application
CMD ["npm", "start"]
```

In this example:

- A new `user` appuser is created and set as the user for subsequent instructions.
- The COPY instruction uses `--chown` to ensure that the files are owned by appuser.
- The application runs with the permissions of appuser, enhancing security.