FROM node:14.16.1-alpine3.13
WORKDIR /app

# Qualquer mudanca nos arquivos abaixo irao forcar a reconstrucao das camadas seguintes durante o build.
# Somente os arquivos  package* serão copiados pois a a ideia é reconstruir essa camada somente se houver
# mudança nas dependências.
COPY package*.json ./
RUN npm install

# Todos os arquivos serao copiados exceto o que estiver definido no .dockerignore.
COPY . .

EXPOSE 8080
CMD ["node", "index.js"]