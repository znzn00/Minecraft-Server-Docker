#!/bin/bash
shutdown() {
	echo "$(date):- Shutting down Minecraft Server..."
	mcrcon -H localhost -P $RCON_PORT -p $RCON_PASSWORD stop
	wait $mcpid
	echo "$(date):- Minecraft Server is down."
	exit 0
}

cd /server/

echo "$(date):- Starting Minecraft Server"

if [ ! -f server.jar ]
then
	echo "$(date):- Server jar missing, downloading..."
	wget $SERVER_JAR -O server.jar
	echo "$(date):- Downloaded server.jar, initializing eula.txt and server.properties..."
	java -jar /server/server.jar nogui --initSettings
	wait $!
	echo "$(date):- Modifying eula.txt"
	sed -i "s/^eula=.*/eula=true/gw /dev/stdout" eula.txt
	echo "$(date):- Modifying server.properties"
	sed -i "s/^server-port=.*/server-port=$MC_PORT/gw /dev/stdout" server.properties
	sed -i "s/^enable-rcon=.*/enable-rcon=true/gw /dev/stdout" server.properties
	sed -i "s/^rcon.port=.*/rcon.port=$RCON_PORT/gw /dev/stdout" server.properties
	sed -i "s/^rcon.password=.*/rcon.password=$RCON_PASSWORD/gw /dev/stdout" server.properties
	sed -i "s/^motd=.*/motd=$SERVER_MOTD/gw /dev/stdout" server.properties
	echo "$(date):- Initialized eula.txt and server.properties."
fi

trap shutdown SIGHUP SIGINT SIGQUIT SIGABRT SIGKILL SIGTERM

java -Xmx$MEMORY -Xms$MEMORY -jar server.jar nogui &
mcpid=$!
echo "$(date):- Server started with PID: ${mcpid}"

wait $mcpid
