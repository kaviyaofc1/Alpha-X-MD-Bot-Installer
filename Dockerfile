FROM node:latest

RUN apt-get update && \
  apt-get install -y \
  ffmpeg \
  imagemagick \
  webp && \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*
WORKDIR /root/AlphaXmd/
RUN git clone https://github.com/SL-Alpha-X-Team/Alpha-X-MD-Bot /root/AlphaXmd
COPY package.json .
RUN npm install
RUN npm install supervisor -g

CMD ["npm", "start"]
