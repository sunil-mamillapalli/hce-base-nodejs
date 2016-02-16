FROM node:4.3.0-slim
RUN apt-get update
RUN apt-get install -y build-essential python

COPY bin/* /src/scripts/
