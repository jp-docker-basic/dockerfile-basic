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