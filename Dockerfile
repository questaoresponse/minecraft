# Use uma imagem base do Ubuntu
FROM ubuntu:latest

# Instale dependências básicas
RUN apt-get update && apt-get install -y \
    wget \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

# Defina o diretório de trabalho
WORKDIR /minecraft

# Baixe o servidor Minecraft Bedrock
RUN wget https://minecraft.azureedge.net/bin-linux/bedrock-server-1.19.70.02.tar.gz -O bedrock-server.tar.gz

# Extraia o arquivo do servidor
RUN tar -zxvf bedrock-server.tar.gz

# Exponha a porta 19132 para conexões de clientes
EXPOSE 19132/udp

# Comando para rodar o servidor
CMD ["./bedrock_server"]
