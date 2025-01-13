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
# RUN wget --no-check-certificate https://www.minecraft.net/bedrockdedicatedserver/bin-linux/bedrock-server-1.21.51.02.zip -O bedrock-server.zip
RUN apt-get update && apt-get install -y unzip
# Descompactar o arquivo .zip
RUN unzip -v bedrock-server.zip
RUN rm bedrock-server.zip

# Exponha a porta 19132 para conexões de clientes
EXPOSE 19132/udp

# Comando para rodar o servidor
CMD ["./bedrock_server"]
