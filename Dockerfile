FROM azul/zulu-openjdk-alpine:17-jre
# mcron install
RUN apk add --update make git gcc musl-dev && \
    cd /tmp && \
    git clone https://github.com/Tiiffi/mcrcon.git && \
    cd mcrcon && \
    make && make install && \
    cd - && rm -rf /tmp/mcrcon && \
    apk del make git gcc musl-dev 
	
ENV MC_PORT 25565
ENV RCON_PORT 25575
ENV RCON_PASSWORD 1234
ENV SERVER_JAR https://launcher.mojang.com/v1/objects/a16d67e5807f57fc4e550299cf20226194497dc2/server.jar
ENV SERVER_MOTD "A Minecraft Server"
ENV MEMORY 8G

WORKDIR /server
VOLUME /server
EXPOSE ${MC_PORT}/tcp
EXPOSE ${RCON_PORT}/tcp

COPY ./run.sh /run.sh
ENTRYPOINT ["sh","/run.sh"]