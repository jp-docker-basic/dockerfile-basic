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

### 4.2 Use Official Base Images

Choose well-maintained and official base images to ensure stability and security.

```Dockerfile
FROM python:3.10-slim
```

### 4.3 Handle Errors Gracefully

Ensure commands handle errors appropriately to avoid build failures.

```Dockerfile
RUN set -e && \
    apt-get update && \
    apt-get install -y curl
```

- `set -e` ensures that the build stops if any command fails.

### 4.4 Use Caching Efficiently

Docker caches the results of RUN instructions. Organize commands to leverage caching effectively:

```Dockerfile
# Install dependencies
RUN apt-get update && \
    apt-get install -y \
        build-essential \
        libffi-dev

# Copy and install application
COPY requirements.txt .
RUN pip install -r requirements.txt
```

- Frequently changing commands should be placed later to maximize cache efficiency.

### 4.5 Avoid Installing Unnecessary Packages

Only install what’s necessary to keep the image lean and secure.

```Dockerfile
RUN apt-get update && \
    apt-get install -y \
        curl \
        && rm -rf /var/lib/apt/lists/*
```

### 4.6 Use Non-Root Users

For improved security, avoid running your application as the root user.

```Dockerfile
# Create a non-root user
RUN useradd -ms /bin/sh appuser
USER appuser
```

## 5. Examples

### 5.1 Installing Packages

```Dockerfile
FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y \
        build-essential \
        curl \
        && rm -rf /var/lib/apt/lists/*
```

### 5.2 Building from Source

```Dockerfile

FROM node:14

WORKDIR /app

COPY . .

RUN npm install && \
    npm run build
```

### 5.3 Multi-Line Commands

```Dockerfile
RUN apt-get update && \
    apt-get install -y \
        git \
        wget && \
    wget https://example.com/file && \
    tar -xvf file && \
    rm file
```
