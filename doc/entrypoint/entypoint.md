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

## Example

### 1. Exec Form:

Dockerfile

> ENTRYPOINT ["python", "-m", "my_module"]

This will execute the my_module Python script when the container starts.

### 2. Shell Form:

Dockerfile

> ENTRYPOINT python -m my_module

This is equivalent to the exec form but uses the shell to execute the command.

## Combining with CMD

The CMD instruction provides default arguments for the `ENTRYPOINT command`. These arguments can be overridden when running the container.

```yml
# Dockerfile

ENTRYPOINT ["python", "-m", "my_module"]
CMD ["--arg1", "value1"]
```

This will execute `python -m my_module --arg1 value1`

However, you can override the arguments:

```bash
docker run my_image --arg1 new_value --arg2 new_value
```
> This will execute python -m my_module --arg1 new_value --arg2 new_value

