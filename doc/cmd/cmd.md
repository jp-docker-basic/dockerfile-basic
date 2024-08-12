# Understanding the CMD Instruction in Dockerfiles

The `CMD` instruction in a `Dockerfile` sets the default command to be executed when a container starts. It's often used to specify the command that the container should run when it's launched without any additional arguments.

```dockerfile
CMD ["executable", "param1", "param2"]
```

or

```Dockerfile
CMD command args
```

## Behavior

- `Overridable`: Unlike ENTRYPOINT, CMD can be overridden when running the container.
- `Default Command`: If no command is specified when running the container, the `CMD` instruction is executed.
- `Multiple CMD`: Only the last CMD instruction in the `Dockerfile` is used.

### Example

```Dockerfile
FROM ubuntu:latest

RUN apt-get update && apt-get install -y curl

CMD ["curl", "http://example.com"]
```

### This Dockerfile will:

- Use the ubuntu:latest image as a base.
- Update the package lists and install curl.
- Set the default command to curl http://example.com.

When you run the container without any additional arguments:

```Bash
docker run my_image
```

#### Overriding the CMD

You can override the CMD instruction when running the container:

```Bash
docker run my_image curl https://www.google.com
```

In this case, the curl https://www.google.com command will be executed instead of the default curl http://example.com.
