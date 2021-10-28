# Minecraft-Server-Docker
This is a simple docker container that runs a vanilla minecraft server. By default, on the first run it will download the jar for a server of Minecraft 1.17.1.
```docker
docker pull znzn00/mcserver:latest
```
Docker Repository: https://hub.docker.com/r/znzn00/mcserver
## Environment variables
| **Name**  | **Usage** |
| ------------- | ------------- |
| MC_PORT  | Minecraft Server's port. |
| RCON_PORT  | Minecraft Server's Rcon port. |
| RCON_PASSWORD | Minecraft Server's Rcon password. |
| SERVER_JAR | URL for a minecraft server jar. |
| SERVER_MOTD | Minecraft Server's motd. |
| MEMORY | Used for java memory arguments for server execution. |
