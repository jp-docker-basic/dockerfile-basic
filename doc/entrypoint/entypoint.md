# Understanding Docker ENTRYPOINT

The `ENTRYPOINT` instruction in a `Dockerfile` defines the command that will be executed when a container is started. It serves as the foundation for the container's behavior.

## Key Characteristics

### 1. Non-Overridable:

Unlike the CMD instruction, ENTRYPOINT cannot be overridden when running the container.

### 2. Flexibility:

You can combine ENTRYPOINT with CMD to provide default arguments that can be overridden.

### 3. Exec Form and Shell Form:

`ENTRYPOINT` can be specified in two forms:

1. `Exec form`: For precise control over the command and arguments.
2. `Shell form`: For simpler commands using the shell.
