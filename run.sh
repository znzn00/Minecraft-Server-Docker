#!/bin/bash
shutdown() {
	echo "$(date):- Shutting down Minecraft Server..."
	echo "stop" > /mcstdin
	
	wait $mcpid
	echo "$(date):- Minecraft Server is down."
	exit 0
}

cd /server/

echo "$(date):- Starting Minecraft Server"
if [ ! -f /mcstdin ]
then
	mkfifo /mcstdin
fi


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
	sed -i "s/^server-port=.*/server-port=$PORT/gw /dev/stdout" server.properties
	echo "$(date):- Initialized eula.txt and server.properties."
fi

trap shutdown SIGHUP SIGINT SIGQUIT SIGABRT SIGKILL SIGTERM
echo "$(date):- Setting message of the day..."
sed -i "s/^motd=.*/motd=$SERVER_MOTD/gw /dev/stdout" server.properties

(tail -f /mcstdin &)| java -Xmx$MEMORY -Xms$MEMORY -jar server.jar nogui &

mcpid=$!

echo "$(date):- Server started with PID: ${mcpid}"

wait $mcpid

echo "$(date):- Minecraft Server have stopped."

exit 0