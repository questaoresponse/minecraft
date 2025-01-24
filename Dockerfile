# Use uma imagem base do Ubuntu
FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    libstdc++6 \
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
RUN apt-get update && apt-get install -y unzip

# Copiar o executável da máquina local para a imagem
COPY bedrock-server.zip /minecraft
# Descompactar o arquivo .zip
RUN chmod +r bedrock-server.zip && unzip bedrock-server.zip -d /minecraft && rm bedrock-server.zip

# Exponha a porta 19132 para conexões de clientes
EXPOSE 19132/udp
RUN ls -l ./minecraft
RUN chmod +x ./minecraft/bedrock_server
# Comando para rodar o servidor
CMD ["./minecraft/bedrock_server"]
