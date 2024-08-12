# Understanding WORKDIR with Path in Dockerfile

**`The WORKDIR Instruction`**

The WORKDIR instruction in a Dockerfile sets the working directory for any RUN, CMD, `ENTRYPOINT`, COPY, and `ADD` instructions that follow it.

```Dockerfile
WORKDIR /app

COPY package.json ./

RUN npm install
```

### In this example:

- `WORKDIR /app` sets the working directory to /app.
- `COPY package.json ./` copies the `package.json` file to the current working directory, which is `/app`.
- `RUN npm install` installs dependencies within the `/app` directory.

### Key Points

- `Absolute Paths`: The path specified in `WORKDIR` is always an absolute path within the container's filesystem.
- `Relative Paths`: You can use relative paths within subsequent commands, but they will be relative to the WORKDIR.
- `Directory Creation`: If the specified directory doesn't exist, it will be created.


