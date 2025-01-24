# Use uma imagem base do Ubuntu
FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    libstdc++6 \
    libcurl4-openssl-dev \
    && apt-get clean

# # Instale dependências básicas
# RUN apt-get update && apt-get install -y \
#     wget \
#     libssl-dev \
#     && rm -rf /var/lib/apt/lists/*

# Defina o diretório de trabalho
WORKDIR /minecraft

# Baixe o servidor Minecraft Bedrock
# RUN wget --no-check-certificate https://www.minecraft.net/bedrockdedicatedserver/bin-linux/bedrock-server-1.21.51.02.zip -O bedrock-server.zip
# RUN apt-get update && apt-get install -y unzip

# Copiar o executável da máquina local para a imagem
COPY bedrock-server.zip /minecraft
COPY server.properties /app/
# Descompactar o arquivo .zip
RUN chmod +r bedrock-server.zip && unzip bedrock-server.zip -d ./server && rm bedrock-server.zip
RUN mv ./server.properties ./server/server.properties
# Exponha a porta 19132 para conexões de clientes
EXPOSE 19132/udp

RUN chmod +x ./server/bedrock_server
# Comando para rodar o servidor
CMD ["./server/bedrock_server"]
