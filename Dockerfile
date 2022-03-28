FROM node:16

# Create app directory
WORKDIR /usr/src/app

#Arguments
ARG DISCORDJS_BOT_TOKEN
ARG DISCORDJS_TEXTCHANNEL_ID

#Environnement Variables
ENV DISCORDJS_BOT_TOKEN=${DISCORDJS_BOT_TOKEN}
ENV DISCORDJS_TEXTCHANNEL_ID=${DISCORDJS_TEXTCHANNEL_ID}

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY /src .

EXPOSE 8080
CMD [ "node", "monitor.js" ]