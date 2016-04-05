FROM node:4.3.0-slim
RUN apt-get update && \
   apt-get install -y build-essential python git && \
   apt-get clean

COPY bin/* /src/bin/
