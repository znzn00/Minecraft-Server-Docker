# Minecraft-Server-Docker
This is a simple docker container that runs a vanilla minecraft server. By default, on the first run it will download the jar for a server of Minecraft 1.17.1.
```docker
docker pull znzn00/mcserver:simple
```
Docker Repository: https://hub.docker.com/r/znzn00/mcserver
<!--Github Repository: https://github.com/znzn00/Minecraft-Server-Docker -->
## Environment variables
| **Name**  | **Usage** |
| ------------- | ------------- |
| PORT  | Minecraft Server's port. |
| SERVER_JAR | URL for a minecraft server jar. |
| SERVER_MOTD | Minecraft Server's motd. |
| MEMORY | Used for java memory arguments for server execution. |
## How does it work?
It executes the server with a bash, and in order to execute `stop` command, it needs a way to comunicate it, so I use rcon, using the client on: https://github.com/Tiiffi/mcrcon
## Help

### How to access the console of the Minecraft Server.
You cannot access directly to the console of Minecraft Server because it isn't PID on the container, meaning, it isn't the main task, you need to enter to the running container CLI and execute: `echo "COMMAND STRING" > /mcstdin`

### Why the server isn't running as PID 1 in the container?
Because it isn't using Rcon to send commands, but pipes. Also, it needs to get the command `stop` to stop safely, as it behaves weirdly with SIGTERM.
