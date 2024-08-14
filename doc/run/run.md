# RUN

The RUN instruction in `Dockerfiles` is used to execute commands during the build process of a Docker image. It is essential for installing software, configuring your environment, and setting up dependencies.

Here’s a detailed guide to using RUN effectively in Dockerfiles:

## 1. Basic Syntax

```Dockerfile
RUN <command>
```
- Executes the specified command in the shell of the base image.
- Each RUN instruction creates a new layer in the Docker image.