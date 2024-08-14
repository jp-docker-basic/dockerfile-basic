# RUN

The RUN instruction in `Dockerfiles` is used to execute commands during the build process of a Docker image. It is essential for installing software, configuring your environment, and setting up dependencies.

Here’s a detailed guide to using RUN effectively in Dockerfiles:

## 1. Basic Syntax

```Dockerfile
RUN <command>
```

- Executes the specified command in the shell of the base image.
- Each RUN instruction creates a new layer in the Docker image.

## 2. Types of RUN Instructions

### 2.1 Shell Form

```Dockerfile
RUN apt-get update && apt-get install -y curl
```

- Executes the command using the shell (`/bin/sh -c` by default).
- Suitable for simple commands and chaining multiple commands.

### 2.2 Exec Form

```Dockerfile
RUN ["apt-get", "update"]
RUN ["apt-get", "install", "-y", "curl"]
```

- Executes the command directly without a shell.
- Avoids shell processing and is useful for commands with complex quoting or for avoiding shell-specific features.

## 3. Combining Commands

To minimize the number of layers and keep the Docker image size small, combine multiple commands using `&&`:

```Dockerfile
RUN apt-get update && \
    apt-get install -y curl && \
    rm -rf /var/lib/apt/lists/*
```
- `&&` ensures that each command runs only if the previous one succeeds.
- Cleaning up temporary files (like `/var/lib/apt/lists/*`) reduces image size.

## 4. Best Practices

### 4.1 Minimize Layers
Combine commands to reduce the number of layers, which helps in keeping the image size smaller.

```Dockerfile

RUN apt-get update && \
    apt-get install -y \
        curl \
        vim \
        git && \
    rm -rf /var/lib/apt/lists/*
```