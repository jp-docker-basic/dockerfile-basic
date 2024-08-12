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
