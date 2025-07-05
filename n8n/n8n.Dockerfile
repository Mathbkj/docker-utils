FROM docker.n8n.io/n8nio/n8n:nightly
WORKDIR /home/node/.n8n
EXPOSE 5678
VOLUME [ "/home/node/.n8n" ]
