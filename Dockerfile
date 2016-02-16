FROM ubuntu:14.04

RUN apt-get install -y software-properties-common
RUN add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe"
RUN apt-get update
RUN apt-get install -y wget python build-essential
RUN wget http://s3pository.heroku.com/node/v0.12.7/node-v0.12.7-linux-x64.tar.gz
RUN mkdir -p /src/node
RUN tar zxvf node-v0.12.7-linux-x64.tar.gz -C /src/node --strip-components=1
RUN rm -rf node-0.4.1-linux-x64.tar.gz
ENV PATH /src/node/bin:$PATH
RUN /src/node/bin/npm install --unsafe-perm --quiet -g npm@3.7.1 2>&1 >/dev/null
RUN useradd -ms /bin/bash node
RUN echo "node ALL=NOPASSWD:ALL" >> /etc/sudoers
RUN mkdir -p /home/node/helionce
RUN chown -R node:node /home/node/helionce
COPY bin/* /src/scripts/
