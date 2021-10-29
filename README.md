# Minecraft-Server-Docker
This is a simple docker container that runs a vanilla minecraft server. By default, on the first run it will download the jar for a server of Minecraft 1.17.1.
```docker
docker pull znzn00/mcserver:latest
```
Docker Repository: https://hub.docker.com/r/znzn00/mcserver
<!--Github Repository: https://github.com/znzn00/Minecraft-Server-Docker -->
## Images
| **Name**  | **Description** |
| ------------- | ------------- |
| [latest](https://github.com/znzn00/Minecraft-Server-Docker/tree/latest)  | Have Rcon enabled by force, it doesn't stop well without it. |
| [simple](https://github.com/znzn00/Minecraft-Server-Docker/tree/simple)  | It doesn't need Rcon, but it lacks a way to interact directly with the console, to send a command check on help. |

## Description
All images are made from azul/zulu-openjdk-alpine:17-jre
