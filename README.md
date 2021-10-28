# Minecraft-Server-Docker
This is a simple docker container that runs a vanilla minecraft server. By default, on the first run it will download the jar for a server of Minecraft 1.17.1.
```docker
docker pull znzn00/mcserver:latest
```
Docker Repository: https://hub.docker.com/r/znzn00/mcserver
<!--Github Repository: https://github.com/znzn00/Minecraft-Server-Docker -->
## Environment variables
| **Name**  | **Usage** |
| ------------- | ------------- |
| MC_PORT  | Minecraft Server's port. |
| RCON_PORT  | Minecraft Server's Rcon port. |
| RCON_PASSWORD | Minecraft Server's Rcon password. |
| SERVER_JAR | URL for a minecraft server jar. |
| SERVER_MOTD | Minecraft Server's motd. |
| MEMORY | Used for java memory arguments for server execution. |
## How does it work?
It executes the server with a bash, and in order to execute `stop` command, it needs a way to comunicate it, so I use rcon, using the client on: https://github.com/Tiiffi/mcrcon
## Help
### How to access the console of the Minecraft Server.
While the container is running, execute `mcrcon -P <RCON_PORT> -p <RCON_PASSWORD>`, for example, using the default values:
> `docker exec -it <Container Name> mcrcon -P 25575 -p 1234`
