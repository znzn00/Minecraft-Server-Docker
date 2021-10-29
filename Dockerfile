FROM azul/zulu-openjdk-alpine:17-jre
	
ENV PORT 25565
ENV SERVER_JAR https://launcher.mojang.com/v1/objects/a16d67e5807f57fc4e550299cf20226194497dc2/server.jar
ENV SERVER_MOTD "A Minecraft Server"
ENV MEMORY 1G

WORKDIR /server
VOLUME /server
# RUN wget $SERVER_JAR -O server.jar
# RUN java -jar /server/server.jar nogui --initSettings
# RUN sed -i "s/^eula=.*/eula=true/gw /dev/stdout" eula.txt
EXPOSE ${PORT}/tcp

COPY ./run.sh /run.sh
ENTRYPOINT ["sh","/run.sh"]